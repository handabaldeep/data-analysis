
function parts = waferstore(p,q,c)
    parts = struct('PartNo',cell(1,length(p)),'Quantity',cell(1,length(p)),'CostPer',cell(1,length(p)));
    if length(p) ~= length(q) || length(p) ~= length(c)
        error('Input vectors need to be of the same size');
    else
       for i = 1:length(p)
           parts(i).PartNo = p(i);
           parts(i).Quantity = q(i);
           parts(i).CostPer = c(i);
           fprintf('%d %.2f\n',parts(i).PartNo, parts(i).Quantity * parts(i).CostPer);
       end
    end
end
