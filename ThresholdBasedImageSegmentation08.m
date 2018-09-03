clc;
clear all;
close all;

im = imread('tb2.jpg'); 
im1 = rgb2gray(im);

n = imhist(im1);
N = sum(n); 
max = 0; 
for i = 1:256
    P(i) = n(i)/N; 
end

for T = 2:255    
    w0 = sum(P(1:T));
    w1 = sum(P(T+1:256)); 
    u0 = dot([0:T-1],P(1:T))/w0; 
    u1 = dot([T:255],P(T+1:256))/w1; 
    sigma = w0*w1*((u1-u0)^2); 
    if sigma>max  
        max = sigma; 
        threshold = T-1;
    end
end
im2=im2bw(im1, threshold/255); 

figure
subplot(1, 2, 1)
imshow(im1);
title('Original Image');
subplot(1, 2, 2)
imshow(im2)
title('Image Segmentation');

