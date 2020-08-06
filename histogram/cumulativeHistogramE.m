function chE = cumulativeHistogramE(ProbPixel, entitled, subPlotPos)

% Compute the cumulative distribution function
CumuPixel = zeros(1,256);
for i = 1:256
    if i == 1
        CumuPixel(i) = ProbPixel(i);
    else
        CumuPixel(i) = CumuPixel(i-1) + ProbPixel(i);
    end
end

subplot(2,4, subPlotPos);
bar(CumuPixel)
title(entitled);

chE = CumuPixel;
end