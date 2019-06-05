% Marking ID - 5912
function res_str = uniqueword(str)
    res_str = '';
    persistent ctr;
    if isempty(ctr)
        ctr = 0;
    end
    if ctr < 5
        ctr = ctr+1;
        res_str = strcat(str,int2str(ctr));
    else
        error('Five words have already been created. Cannot create more words');
    end
end