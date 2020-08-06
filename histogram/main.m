myImage = imread('peppers.png');
I = myImage;

[height, width, numberOfColorChannels] = size(myImage);

if numberOfColorChannels > 1
   disp(numberOfColorChannels);
   I = rgb2gray(myImage);
end


subplot(241)
imshow(I)
title('Original Image');

% NumPixel is the number of occurences of each gray level
NumPixel = histogramE(I, 'Histogram of Original Image', 2);

% ProbPixel is the probability of an occurrence of each gray level
ProbPixel = normalizedHistogramE(NumPixel, I, 'Normalized Histogram of Original Image',3);

% Cumupixel is the cumulative distribution function
CumuPixel = cumulativeHistogramE(ProbPixel, 'Cumulative Histogram of Original Image', 4);

% The Cumupixel convert to new gray levels
Map = zeros(1,256);
for i = 1:256
    Map(i) = uint8(255 * CumuPixel(i)+0.5);
end
for i = 1:height
    for j = 1:width
        I(i,j)=Map(I(i,j) + 1);
    end
end



% show the new image
subplot(245)
imshow(I)
title('New Image');

NumPixel = histogramE(I, 'Histogram of new Image', 6);
ProbPixel = normalizedHistogramE(NumPixel, I, 'Normalized Histogram of Original Image', 7);
CumuPixel = cumulativeHistogramE(ProbPixel, 'Cumulative Histogram of Original Image', 8);

