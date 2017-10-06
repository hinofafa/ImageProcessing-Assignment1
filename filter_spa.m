function [ img_result ] = filter_spa( img_input, filter )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    I = img_input;
    [x,y] = size(I);
    [f,g] = size(filter);
    %disp("f is "+f);
    if f~=g 
        disp("This filter is not a square.");
        return;
    end
    if mod(f,2)==0
        disp("Size of the filter is even.");
        return;
    end
    dim = (f-1)/2;
    %disp("dim is: "+dim)
    for i = 1+dim:x-dim
        for j = 1+dim:y-dim
            %disp("i: "+i+" j: "+j)
            subI = I(i-dim:i+dim,j-dim:j+dim);
            subI = double(subI);
            img_result(i,j) = sum(dot(subI,filter));
        end
    end
    img_result = uint8(img_result);
end

