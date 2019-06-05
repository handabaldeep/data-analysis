

function [matEVec,ev] = myPCA(mat)
    covmat = cov(mat);
    ev_us = eig(covmat);    % Eigen values unsorted
    [matEVec_us,~] = eig(covmat);   % Eigen vector unsorted
    [ev,ev_order] = sort(ev_us,'descend');
    matEVec = matEVec_us(:,ev_order);
end
