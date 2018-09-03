clc;
clear all;
close all;

i1 = imread('a.jpg');
i2 = imread('butterfly.jpg');
h = imread('tb1.jpg');

[r1, c1, d1] = size(i1);
[r2, c2, d2] = size(i2);

r = max(r1, r2);
c = max(c1, c2);
d = max(d1, d2);

i3 = zeros(r, c, d);
i4 = zeros(r, c, d);

%resizing image
for m = 1:r
    for n = 1:c
        for o = 1:d
            if m>0 && m<=r1 && n>0 && n<=c1 && o>0 && o<=d1
                i3(m, n, o) = i1(m, n, o);
            else
                i3(m, n, o) = 0;
            end
            if m>0 && m<=r2 && n>0 && n<=c2 && o>0 && o<=d2
                i4(m, n, o) = i2(m, n, o);
            else
                i4(m, n, o) = 0;
            end
        end
    end
end

add = zeros(r, c, d);
sub = zeros(r, c, d);

% addition, subtraction
for m = 1:r
    for n = 1:c
        for o = 1:d
            add(m, n, o) = min(255, i3(m, n, o)+i4(m, n, o));
            sub(m, n, o) = max(0, i3(m, n, o)-i4(m, n, o));
        end
    end
end
add = uint8(add);
sub = uint8(sub);

%Normalization
mn = min(h(:));
mx = max(h(:));
newMn = 0;
newMx = 255;
nor = (h-mn).*((newMx-newMn)/(mx-mn)) + newMn;
disp(mn);
disp(mx);

figure
subplot(3, 2, 1)
imshow(i1);
title('Original Image 1');
subplot(3, 2, 2);
imshow(i2);
title('Original Image 2');
subplot(3, 2, 3);
imshow(add);
title('Image after addition');
subplot(3, 2, 4);
imshow(sub);
title('Image after subtraction');
subplot(3, 2, 5)
imshow(h);
title('Before Normalization');
subplot(3, 2, 6)
imshow(nor);
title('After Normalization');
