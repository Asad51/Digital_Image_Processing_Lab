clc;
clear all;
close all;

im = imread('hist.jpg');
[r, c, d] = size(im);
im1 = zeros(r, c);
im2 = zeros(r, c);
%rgb to gary
for i=1:r
    for j=1:c
        im1(i, j) = im(i, j);
    end
end

n = r*c;
hist1 = zeros(256, 1);
hist2 = zeros(256, 1);
pdf = zeros(256, 1);
cdf = zeros(256, 1);
csum = zeros(256, 1);
out = zeros(256, 1);

rn = 0:255;

%Histogram Equalization
for i =1:r
    for j=1:c
        t =im1(i, j);
        hist1(t+1) = hist1(t+1) + 1;
        pdf(t+1)= hist1(t+1)/n;
    end
end

sum =0;L=255;

for i=1:size(pdf)
    sum = sum + hist1(i);
    csum(i) = sum;
    cdf(i) = csum(i)/n;
    out(i) = round(cdf(i)*L);
end
for i =1:r
    for j=1:c
        im2(i,j) = out(im1(i,j)+1);
        t = im2(i, j);
        hist2(t+1) = hist2(t+1) + 1;
    end
end

figure
subplot(2, 2, 1);
imshow(im1/255);
title('Original Image');
subplot(2, 2, 2);
bar(rn, hist1, 'BarWidth', 0.1, 'FaceColor', 'b');
xlabel('Gray Levels');
ylabel('Frequencies');
title('Histogram of Original Image')
subplot(2, 2, 3);
imshow(im2/255);
title('Equalized Image');
subplot(2, 2, 4)
bar(rn, hist2, 'BarWidth', 0.1, 'FaceColor', 'b');
xlabel('Gray Levels');
ylabel('Frequencies');
title('Histogram of Equalized Image')
