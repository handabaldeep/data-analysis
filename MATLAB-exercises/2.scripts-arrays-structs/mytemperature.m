
function m = mytemperature(a,b)
% Convert min,max temperature in degree F to degree C
    m = zeros(2,2);
    m(1,1) = min(a,b);
    m(2,1) = max(a,b);
    m(1,2) = (m(1,1)-32)*(5/9);
    m(2,2) = (m(2,1)-32)*(5/9);
    print_matrix(m);
end

function print_matrix(mat)
% Print the temperature matrix
    fprintf('  Degree F   Degree C\n');
    disp(mat);
end
