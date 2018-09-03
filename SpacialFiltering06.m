clc; 
clear all; 
close all;

im = imread('spf.png');
[r, c, d] = size(im);
im1 = zeros(r, c);
for i = 1:r
    for j = 1:c
        im1(i, j) = im(i, j);
    end
end
sum = 0;
p = 3;
f = floor(p/2);

im2 = zeros(r, c);

for x=1:r
    for y=1:c
        sum = 0;
        mx = 0;
        mn = 256;
        tm = zeros(p*p);
        k = 1;
        for i=x-f:x+f
            for j=y-f:y+f
                if (i>0 && j>0) && (i<=r && j<=c)
                    sum = sum + im1(i,j)/(p*p);
                    mx = max(mx, im1(i, j));
                    mn = min(mn, im1(i, j));
                    tm(k) = im1(i, j);
                else
                    tm(k) = 0;
                end
                k = k + 1;
            end
        end
        tma = sort(tm);
        %average
        im2(x, y) = ceil(sum);
        %max
        im3(x, y) = mx;
        %min
        im4(x, y) = mn;
        %median
        tp = ceil((p*p)/2);
        im5(x, y) = tma(tp);
    end
end
im2 = uint8(im2);
im3 = uint8(im3);
subplot(2, 2, 1);
imshow(im2)
title('Average Filtering')
subplot(2, 2, 2);
imshow(im3)
title('Max Filtering')
subplot(2, 2, 3);
imshow(im4/255)
title('Min Filtering')
subplot(2, 2, 4);
imshow(im5/255);
title('Median Filtering')
