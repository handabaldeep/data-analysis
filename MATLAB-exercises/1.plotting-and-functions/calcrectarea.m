

function area = calcrectarea(len,wid)
% Calculate area of a rectange with length l and width w
    if length(len) ~= length(wid)
        disp('Area cannot be calculated as the length of the vectors is different');
    else
        area = len .* wid;
    end
end



