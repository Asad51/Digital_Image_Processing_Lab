clc;
clear all;
close all;

im = imread('tb1.jpg');
im1 = rgb2gray(im);
[row,col] = size(im1);
im2 = zeros(row,col);

for i = 1:row
    for j = 1:col
        g = double (im1(i,j));
        if g>100
            im2(i,j) = g;
        else
            im2(i,j) = 0;
        end
    end
end


figure
subplot(1, 2, 1)
imshow(im1)
title('Original Grayscale Image')

subplot(1, 2, 2)
imshow(im2);
title('Image Segmentation')

        