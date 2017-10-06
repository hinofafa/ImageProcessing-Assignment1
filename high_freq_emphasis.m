function [ img_result ] = high_freq_emphasis( img_input, a, b, type )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if strcmp('butterworth',type)
    f = a+b*butterworth(size(img_input),0.1,1);
elseif strcmp('gaussian',type)
    f = a+b*gaussian(size(img_input),0.1);
else
    return
end
H = ifftshift(f);
ft = fft2(img_input);
img_result = uint8(ifft2(ft.*H));
end

