recName = 'data/S001/S001R12.edf';
[ eeg, fs, ts] = rdsamp(recName, 1:64);
eeg = transpose(eeg);
[T0, T1, T2] = getIntervals(recName, 'event', fs, size(eeg, 2));
t1dat0 = eeg(:, T1(1,1):T1(1,2));
t2dat0 = eeg(:, T2(1,1):T2(1,2));

t1dat1 = eeg(:, T1(size(T1,1),1):T1(size(T1,1),2));
t2dat1 = eeg(:, T2(size(T2,1),1):T2(size(T2,1),2));

W = f_CSP(t1dat0, t2dat0);

S11 = W*t1dat1;
S21 = W*t2dat1;

S11A = [S11(1, :).', S11(size(S11,1),:).'].';
S21A = [S21(1, :).', S21(size(S21,1),:).'].';
figure
plot (S11A(1,:), S11A(2,:), 'o');
hold on
plot (S21A(1,:), S21A(2,:), 'x');


t1dat2 = eeg(:, T1(size(T1,1)-1,1):T1(size(T1,1)-1,2));
t2dat2 = eeg(:, T2(size(T2,1)-1,1):T2(size(T2,1)-1,2));
t1dat3 = eeg(:, T1(size(T1,1)-2,1):T1(size(T1,1)-2,2));
t2dat3 = eeg(:, T2(size(T2,1)-2,1):T2(size(T2,1)-2,2));
S12 = W * t1dat2;
S22 = W * t2dat2;
S13 = W * t1dat3;
S23 = W * t2dat3;
S12A = [S12(1, :).', S12(size(S12,1),:).'].';
S22A = [S22(1, :).', S22(size(S22,1),:).'].';
S13A = [S13(1, :).', S13(size(S13,1),:).'].';
S23A = [S23(1, :).', S23(size(S23,1),:).'].';
for i=1:2
    lv11A(i,:) = log(var(S11A(i,:)));
    lv21A(i,:) = log(var(S21A(i,:)));
    lv12A(i,:) = log(var(S12A(i,:)));
    lv22A(i,:) = log(var(S22A(i,:)));
    lv13A(i,:) = log(var(S13A(i,:)));
    lv23A(i,:) = log(var(S23A(i,:)));
end

function [T0, T1, T2] = getIntervals(recName,annotator,fs,sigLen)
    T0=[];
    T1=[];
    T2=[];
    [annot, ~, ~, ~, ~, cmt] = rdann(recName, annotator);
    cmt = string(cmt);
    for i=1:size(annot,1)
        splt=split(cmt(i), ' ');
        dur = str2double(splt(3))*fs;
        intEnd = annot(i) + dur-1;
        if (i<length(annot))
            intEnd = min(annot(i+1)-1, intEnd);
        else
            intEnd = min(sigLen, intEnd);
        end
        if (splt(1)=="T0")
            T0 = [T0; [annot(i) intEnd]];
        elseif (splt(1)=="T1")
            T1 = [T1; annot(i) intEnd];
        elseif (splt(1)=="T2")
            T2 = [T2; annot(i) intEnd];
        end
    end
end

function [result] = f_CSP(varargin)
  if (nargin ~= 2)
      disp('Must have 2 classes for CSP!')
  end
  Rsum=0;
  for i = 1:nargin 
      R{i} = ((varargin{i}*varargin{i}')/trace(varargin{i}*varargin{i}'));%instantiate me before the loop!
      Rsum=Rsum+R{i};
  end
  [EVecsum,EValsum] = eig(Rsum);
  [EValsum,ind] = sort(diag(EValsum),'descend');
  EVecsum = EVecsum(:,ind);
    
  W = sqrt(inv(diag(EValsum))) * EVecsum';
  for k = 1:nargin
      S{k} = W * R{k} * W'; %       Whiten Data Using Whiting Transform - Ramoser Equation (4)
  end 
  [B,D] = eig(S{1},S{2});    
  [D,ind]=sort(diag(D));B=B(:,ind);
  result = B'*W;
end