% Marking ID -5912
function [iN,str] = sumcomplex(rl,im,c)
% Return array of structs represening complex numbers and string
% representing the sum of complex nos of given indices
    iN = struct('real',cell(1,length(rl)),'img',cell(1,length(rl)));
    str = '';
    if length(rl)~=length(im)
        error('Real and Imaginary Vectors must be of equal length');
    else
        for i=1:length(rl)
            iN(i).real = rl(i);
            iN(i).img = im(i);
        end
        real_sum = 0;
        img_sum = 0;
        for i=1:length(c)
            if(c(i)>length(rl))
                error('Index of element cannot be larger than the size of the vector');
            else
                real_sum = real_sum + iN(c(i)).real;
                img_sum = img_sum + iN(c(i)).img;
            end
        end
        str = strcat(num2str(real_sum),'+',num2str(img_sum),'i');
        %disp(str);
    end
end