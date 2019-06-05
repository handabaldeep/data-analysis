% Marking ID - 5912
function c_arr = buildrandomstrings(n)
    s = 'a':'z';
    len = abs(n);
    str = s(randi(numel(s),[1,len]));
    c_arr = cell(1,len);
    for i=1:len
        c_arr{i} = str(1:i);
    end
    if n < 0
        c_arr = fliplr(c_arr);
    end
end