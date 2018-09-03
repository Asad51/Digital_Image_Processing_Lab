clc;
clear all;
close all;

im = imread('fdf.png');
[rows,colums, depth] = size(im);
im1 = zeros(rows, colums);
for x = 1:rows
    for y = 1:colums
        im1(x,y) = im(x,y);
    end
end
im1 = uint8(im1);

hpMask = [-1 -1 -1;-1 10 -1;-1 -1 -1]/9;
hpfimg = imfilter(im1, hpMask, 'same');

lpMask = [1 1 1;1 1 1;1 1 1]/9;
lpfimg = imfilter(im1, lpMask, 'same');

figure
subplot(2, 2, 1)
imshow(im)
title('Original Color Image')
subplot(2, 2, 2)
imshow(im1)
title('Grayscale Image')
subplot(2, 2, 3)
imshow(hpfimg);
title('High pass filtered Image');
subplot(2, 2, 4)
imshow(lpfimg);
title('Low pass filtered Image');