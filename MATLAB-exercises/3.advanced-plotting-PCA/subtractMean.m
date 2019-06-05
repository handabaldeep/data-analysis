% Marking ID-5912
function [matmu,mn] = subtractMean(mat)
    mn = mean(mat);
    matmu = mat - mn;
end