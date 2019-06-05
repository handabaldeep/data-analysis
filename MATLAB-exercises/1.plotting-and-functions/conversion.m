

function ret = conversion(ch,vec)
    if ch=='f'
        ret = vec .* 0.3048;
    elseif ch=='m'
        ret = vec .* 3.28084;
    else
        disp('The values needs be either in feet or meters unit')
    end
end



