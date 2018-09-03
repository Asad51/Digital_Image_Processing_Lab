clc;
clear all;
close all;

im1 = imread('butterfly.jpg');
im2 = rgb2gray(im1);
im2 = im2bw(im2);

se = [1 1 1; 1 1 1; 1 1 1];
[r,c] = size(im2);
tem = zeros(r+2,c+2);
for i = 2:r
    for j = 2:c
        tem(i,j) = im2(i,j);
    end
end
di = zeros(r, c);
er = zeros(r, c); 
for i = 1:r-2
    for j = 1:c-2
        ma_square = tem(i:(i+2),j:(j+2));
        new_mat = ma_square.*se;
        di(i+1,j+1) = max(max(new_mat));
        er(i+1,j+1) = min(min(new_mat));
    end
end

op = zeros(r, c);
cl = zeros(r, c);
tem1 = zeros(r+2, c+2);
tem2 = zeros(r+2, c+2);
for i = 2:r
    for j = 2:c
        tem1(i, j) = di(i, j);
        tem2(i, j) = er(i, j);
    end
end
for i = 1:r-2
    for j = 1:c-2
        m1 = tem1(i:(i+2),j:(j+2));
        m2 = tem1(i:(i+2),j:(j+2));
        new_mat1 = m1.*se;
        new_mat2 = m2.*se;
        op(i+1,j+1) = max(max(new_mat1));
        cl(i+1,j+1) = min(min(new_mat2));
    end
end

figure
subplot(2, 3, 1)
imshow(im1)
title('Original Color Image');
subplot(2, 3, 2)
imshow(im2);
title('Grayscale Image');
subplot(2, 3, 3)
imshow(di)
title('Dilation');
subplot(2, 3, 4)
imshow(er)
title('Erosion');
subplot(2, 3, 5)
imshow(op)
title('Opening');
subplot(2, 3, 6)
imshow(cl)
title('Closing');


        
        
