clc;
clear all;
close all;

i = imread('butterfly.jpg');
[r, c, d] = size(i);
j = zeros(r, c);
for m = 1:r
    for n = 1:c
        j(m, n) = i(m, n);
    end
end

j = uint8(j);
figure
subplot(2, 1, 1)
imshow(i)
title('Original Color Image');
subplot(2, 1, 2)
imshow(j)
title('Gray Scale Image');

