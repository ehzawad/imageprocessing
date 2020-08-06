function nhE = normalizedHistogramE(NumPixel, I, entitled, subPlotPos)

[height, width] = size(I);

% compute the probability of an occurance of each gray level

probPixel = zeros(1, 256);

for i = 1 : 256
    probPixel(i) = NumPixel(i) / (height * width * 1.0);
end

subplot(2, 4, subPlotPos)

bar(probPixel);

title(entitled);

nhE = probPixel;

end

