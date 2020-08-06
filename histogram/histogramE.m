function hE = histogramE(I, entitled, subPlotPos)

% image matrix
[height, width] = size(I);

numPixels = zeros(1, 256);
for i = 1:height
    for j = 1:width
        numPixels(I(i, j) + 1) = numPixels(I(i, j) + 1) + 1;
    end
end

subplot(2, 4, subPlotPos);
bar(numPixels)
title(entitled)

hE = numPixels;

end