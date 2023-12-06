cd wfdbtoolbox/
[old_path]=which('rdsamp'); if(~isempty(old_path)) rmpath(old_path(1:end-8)); end
cd mcode
addpath(pwd)
savepath
cd ../..