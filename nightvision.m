
img = imread('peppers.png'); % Read image

red = img(:,:,1); % Red channel
green = img(:,:,2); % Green channel
blue = img(:,:,3); % Blue channel

a = zeros(size(img, 1), size(img, 2));

G = cat(3, a, green, a);
R = rdivide(G, 2);
B = times(2, R);
nightvision = times(2, B);

img = uint8(rescale(round(double(nightvision)./25), 0, 255));
Iblur = imgaussfilt(img,0.3);

imshow(Iblur);


