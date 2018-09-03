clc;
clear all;
close all;

im = imread('bit.png');
[r, c, d] = size(im);
im1 = zeros(r, c);
for i = 1:r
    for j = 1:c
        im1(i, j) = double(im(i, j));
    end
end

bit0 = mod(im1,2);
bit1 = mod(floor(im1/2),2);
bit2 = mod(floor(im1/4),2);
bit3 = mod(floor(im1/8),2);
bit4 = mod(floor(im1/16),2);
bit5 = mod(floor(im1/32),2);
bit6 = mod(floor(im1/64),2);
bit7 = mod(floor(im1/128),2);

figure
subplot(3, 3, 1);
imshow(im);
title('Original Image');

subplot(3, 3, 2);
imshow(bit0);
title('Slice at bit-plane 0');

subplot(3, 3, 3);
imshow(bit1);
title('Slice at bit-plane 1');

subplot(3, 3, 4);
imshow(bit2);
title('Slice at bit-plane 2');

subplot(3, 3, 5);
imshow(bit3);
title('Slice at bit-plane 3');

subplot(3, 3, 6);
imshow(bit4);
title('Slice at bit-plane 4');

subplot(3, 3, 7);
imshow(bit5);
title('Slice at bit-plane 5');

subplot(3, 3, 8);
imshow(bit6);
title('Slice at bit-plane 6');

subplot(3, 3, 9);
imshow(bit7);
title('Slice at bit-plane 7');


