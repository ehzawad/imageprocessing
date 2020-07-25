
IM = imread('peppers.png');

scalingFactor = 45;

IM = uint8(rescale(round(double(IM)./scalingFactor),0,255));


%disp(IM);

imshow(IM);
