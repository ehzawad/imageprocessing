clc;
close all;



im = imread('peppers.png');
[mO, nO, cO] = size(im);
disp(cO);
disp(mO);
disp(nO);

img = rgb2gray(im);

imd = double(img);
[m, n, c] = size(imd);

disp(c);
disp(m);
disp(n);

gamma = 1.7;

output = abs((1*imd).^gamma);

% normalize this output on an intensity scale of [0, 255]

% disp(output)

maxPixel = max(output(:));
minPixel = min(output(:));


for i = 1:m
    for j = 1:n
        output(i, j) = (255*output(i, j))/(maxPixel - minPixel);
    end
end

do_uint8 = uint8(output);


gamma2 = 0.7;

output2 = abs((1*imd).^gamma2);

% normalize this output on an intensity scale of [0, 255]

% disp(output)

maxPixel2 = max(output2(:));
minPixel2 = min(output2(:));


for i = 1:m
    for j = 1:n
        output2(i, j) = (255*output2(i, j))/(maxPixel2 - minPixel2);
    end
end

do_uint82 = uint8(output2);

% disp(do_uint8);

subplot(221), imshow(im);
subplot(222), imshow(img);
subplot(223), imshow(do_uint8);
subplot(224), imshow(do_uint82);
