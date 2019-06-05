
function res = evenodd(n)
    v = randi([0,30],1,n);
    disp(v);
    v = v(1:2:n);    % exract values at odd places
    e = ~mod(v,2);   % logical vector
    res = v(e);      % extract the even numbers
end


