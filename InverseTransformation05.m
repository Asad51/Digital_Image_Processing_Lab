clc;
clear all;
close all;

% Inverse transform
im = imread('butterfly.jpg');
[r, c, d] = size(im);
im1 = zeros(r, c, d);

%transformation
for i = 1:r
    for j = 1:c
        for k = 1:d
            im1(i, j, k) = 255 - im(i, j, k);
        end
    end
end
figure
subplot(1, 2, 1)
imshow(im);
title('Original Image');
subplot(1, 2, 2)
imshow(im1/255);
title('Negative Image');
