clc;
clear all;
close all;

im = imread('ed.png');
im1 = rgb2gray(im);
im2 = double(im1);
[r,c] = size(im2);
x_cal = zeros(r-3,c-3);
maskx = [-1 -2 -1;0 0 0;1 2 1];
for ix = 1:(r-3)
    for jx = 1:(c-3)
        axsquare = im2(ix:(ix+2),jx:(jx+2));
        res = maskx.*axsquare ;
        x_cal(ix,jx) =sum(sum(res)); 
    end
end

y_cal = zeros(r-3,c-3);
masky = [-1 0 1;-2 0 2;-1 0 1];
for iy = 1:(r-3)
    for jy = 1:(c-3)
        aysquare = im2(iy:(iy+2),jy:(jy+2));
        res = masky.*aysquare ;
        y_cal(iy,jy) = sum(sum(res)); 
    end
end

result = sqrt(x_cal.^2 + y_cal.^2);

figure
subplot(2, 2, 1)
imshow(im1)
title('Original Grayscale Image')

subplot(2, 2, 2)
imshow(x_cal)
title('Edge Detection at x-axis')

subplot(2, 2, 3)
imshow(y_cal)
title('Edge Detection at y-axis')


subplot(2, 2, 4)
imshow(result/255)
title('Combined Edge Detection')
