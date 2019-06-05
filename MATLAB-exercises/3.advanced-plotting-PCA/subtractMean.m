
function [matmu,mn] = subtractMean(mat)
    mn = mean(mat);
    matmu = mat - mn;
end
