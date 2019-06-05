
i = 0;
y = 0;
f = false;
while f~=true
    y = y + 1/factorial(i);
    if (abs(exp(1)-y)) < 0.0001
        f = true;
    end
    i = i+1;
end
fprintf('Built-in value of e: %.4f\n',exp(1));
fprintf('Approximated value of e: %.4f\n',y);
fprintf('Value of n: %d\n',i-1);
