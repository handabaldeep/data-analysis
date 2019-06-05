

function plottrigs(str,varargin)
    x = -2*pi:0.1:2*pi;
    numvargs = length(varargin);
    if numvargs > 3
        error('Requires at most 3 optional inputs, no more than 3');
    end
    optargs = {'k' 1 '.'};  %default values
    optargs(1:numvargs) = varargin; 
    [c, w, m] = optargs{:};
    eval(sprintf('plot(x,%s(x),''%c%c-'',''LineWidth'',%d)',str,c,m,w));
    title(sprintf('%d input arguments',numvargs+1));
    ylabel(sprintf('%s(x)',str));
    grid on;
end
