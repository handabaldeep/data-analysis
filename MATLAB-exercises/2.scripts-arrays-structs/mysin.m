% Marking ID - 5912

function mysin(num1,num2)
    choice_colour = menu('Choose a colour', 'red','blue','green');
    choice_style = menu('Choose a style for points', 'circle','star');
    switch choice_colour
        case 1
            colour = 'r';
        case 2
            colour = 'b';
        case 3
            colour = 'g';
        otherwise
            colour = '';
    end
    switch choice_style
        case 1
            style = 'o';
        case 2
            style = '*';
        otherwise
            style = '';
    end
    str_format = strcat(colour,style,'-');
    pt1 = [0:2*pi/(num1-1):2*pi];
    pt2 = [0:2*pi/(num2-1):2*pi];
    subplot(2,1,1);
    plot(pt1,sin(pt1),str_format);
    grid on
    title(strcat(num2str(num1),' points'));
    subplot(2,1,2);
    plot(pt2,sin(pt2),str_format);
    grid on
    title(strcat(num2str(num2),' points'));
end