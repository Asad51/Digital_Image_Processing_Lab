clc;
clear all;
close all;

% Power law transform
im = imread('power.png');
[r, c, d] = size(im);
im1 = zeros(r, c);
%rgb to gary
for i = 1:r
    for j = 1:c
        im1(i, j) = double(im(i, j));
    end
end

con = 1;
%transformation
im2 =zeros(r,c);
for i = 1:r
    for j = 1:c
        im2(i, j) = con * im1(i, j).^(2.0);
    end
end
figure
subplot(1, 2, 1)
imshow(im1/255);
title('Original Grayscale Image');
subplot(1, 2, 2)
imshow(im2/255);
title('Log Transformed Image');
