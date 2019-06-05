% Marking ID - 5912
function vc = calctrianglearea(mat)
% Calculate area of triangles using vertices
    % If a multiple of 3 or not
    r = rem(length(mat),3);
    len = length(mat)-r;
    vc = zeros(1,len/3);
    i = 1;
    j = 1;
    while i<=len-2
        a = calclength(mat(1,i),mat(2,i),mat(1,i+1),mat(2,i+1));
        b = calclength(mat(1,i+1),mat(2,i+1),mat(1,i+2),mat(2,i+2));
        c = calclength(mat(1,i+2),mat(2,i+2),mat(1,i),mat(2,i));
        s = (a+b+c)/2;
        vc(j) = (s*(s-a)*(s-b)*(s-c))^0.5;
        %fprintf('%d %d %f %f %f %f %f\n',j,i,s,a,b,c,vc(j));
        j = j+1;
        i = i+3;
    end
    fprintf('Area of %d triangle(s) calculated.\n',j-1);
    if(r>0)
        fprintf('The coordinates not used for this calculation are-\n');
    else
        fprintf('All the coordinates were used for this calculation');
    end
    for k=i:length(mat)
        fprintf('(%d , %d)\n',mat(1,k),mat(2,k));
    end
end

function l = calclength(x1,y1,x2,y2)
    l = ((x1-x2)^2 + (y1-y2)^2)^0.5;
end