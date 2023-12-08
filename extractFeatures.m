% usages:
% extractFeatures("data/S001/S001", 4, true)
% after extraction:
% doClassification('featureVectors.txt', 'referenceClass.txt', {1, 0}, 10, 50, 0);

function extractFeatures(data_path, starting_record, includeAR)
    record = [];
    for i=0:2
        record = [record string(num2str(starting_record+i*4, '%02d'))];
    end

    t1s = cell(0);
    t2s = cell(0);

    for i=1:numel(record)
        recName = strcat(data_path, "R", record(i), ".edf");
        recName = convertStringsToChars(recName);
        disp(recName);

        [eeg, fs, ~] = rdsamp(recName, 1:64);

        [~, T1, T2] = getIntervals(recName, 'event', fs, size(eeg,1));

        eeg = eeg.';

        for j = 1:size(T1, 1)
            segment = eeg(:, T1(j, 1):T1(j, 2));
            t1s{end + 1} = segment;
        end

        for j = 1:size(T2, 1)
            segment = eeg(:, T2(j, 1):T2(j, 2));
            t2s{end + 1} = segment;
        end

    end

    featF = 'featureVectors.txt';
    clasF = 'referenceClass.txt';
    fvf = fopen(featF, "wt");
    rcf = fopen(clasF, "wt");

    f = [0 8 8 13 13 fs/2]/(fs/2);
    a = [0 0 1 1 0 0];
    n = 35;
    b = firls(n, f, a);

    [W] = f_CSP(cell2mat(t1s(1)), cell2mat(t2s(1)));
    t1s(1) = [];
    t2s(1) = [];

    lvt1 = cell(size(t1s));
    lvt2 = cell(size(t2s));

    p = 2;

    for i = 1:numel(t1s)
        cst = W * cell2mat(t1s(i));
        cse = [cst(1, :).', cst(size(cst, 1), :).'].';
        csf = filter(b, 1, cse);
        % csf = filter(b, 1, cse.').';

        if includeAR
            AR_features = [];
            AR_order = min(p, size(csf, 1) - 1);
            for j = 1:size(csf, 2)
                AR_coeffs = arburg(csf(:, j), AR_order);
                AR_features = [AR_features; AR_coeffs'];
            end
            lvt1{i} = [log(var(csf(1, :))), log(var(csf(2, :))), AR_features(:)'];
        else
            lvt1{i} = [log(var(csf(1, :))), log(var(csf(2, :)))];
        end
    end

    for i = 1:numel(t2s)
        cst = W * cell2mat(t2s(i));
        cse = [cst(1, :).', cst(size(cst, 1), :).'].';
        csf = filter(b, 1, cse);
        % csf = filter(b, 1, cse.').';

        if includeAR
            AR_features = [];
            AR_order = min(p, size(csf, 1) - 1);
            for j = 1:size(csf, 2)
                AR_coeffs = arburg(csf(:, j), AR_order);
                AR_features = [AR_features; AR_coeffs'];
            end
            lvt2{i} = [log(var(csf(1, :))), log(var(csf(2, :))), AR_features(:)'];
        else
            lvt2{i} = [log(var(csf(1, :))), log(var(csf(2, :)))];
        end
    end

    for i = 1:numel(lvt1) - 1
        fprintf(fvf, '%.8f %.8f', lvt1{i}(1), lvt1{i}(2));
        for k = 3:numel(lvt1{i})
            fprintf(fvf, ' %.8f', lvt1{i}(k));
        end
        fprintf(fvf, '\n');
        fprintf(rcf, 'T1\n');
    end

    for i = 1:numel(lvt2) - 1
        fprintf(fvf, '%.8f %.8f', lvt2{i}(1), lvt2{i}(2));
        for k = 3:numel(lvt2{i})
            fprintf(fvf, ' %.8f', lvt2{i}(k));
        end
        fprintf(fvf, '\n');
        fprintf(rcf, 'T2\n');
    end

    fclose(fvf);
    fclose(rcf);

end
