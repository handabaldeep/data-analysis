% Marking ID - 5912
i = 1;
f = false;
y = 0;
while f~=true
    x = (1-1/i)^i;
    y = 1/x;
    if (abs(exp(1)-y)) < 0.0001
        f = true;
    end
    i = i+1;
end
fprintf('Built-in value of e: %.4f\n',exp(1));
fprintf('Approximated value of e: %.4f\n',y);
fprintf('Value of n: %d\n',i-1);