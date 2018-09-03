clc;
clear all;
close all;

im = imread('butterfly.jpg');
[rows,colums, depth] = size(im);
i=1; j=1; k=1;
factor = 3;
im1 = zeros(rows/factor , colums/factor);
for x = 1:factor:rows
    for y = 1:factor:colums
        for z= 1:depth;
            im1(i,j, k) = im(x,y,z);
            k = k+1;
        end
        k = 1;
        j = j+1;
    end
    i = i+1;
    j=1;
end
im1 = uint8(im1);
[r, c, d] = size(im1);

figure
subplot(1, 2, 1)
imshow(im);
title(['Image Dimension :' num2str(rows) ' x ' num2str(colums)]);
subplot(1, 2, 2)
imshow(im1);
title(['Image Dimension :' num2str(r) ' x ' num2str(c)]);
