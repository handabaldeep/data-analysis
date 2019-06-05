

function myplotarea(nm,n)
    str = fileread(nm);
    seg = strings(0);
    rest = str;
    % Convert the string into vector of words
    while rest ~= ""
        [first,rest] = strtok(rest);
        seg = [seg ; first];
    end
    % remove empty cells
    seg = seg(~cellfun('isempty',seg));
    % Number of elements
    noe = length(seg)/4;
    if n > noe
        error('Value of n exceeds the number of elements present in the file');
    else
        x = seg(2:4:noe*4);
        X = str2double(x);
        y = seg(4:4:noe*4);
        Y = str2double(y);
        area(X(1:n),Y(1:n));
        title(sprintf('%d data points',n));
    end
end
