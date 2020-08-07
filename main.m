A = imread('Edge_Glow_in.jpg');
% Imrgb = rgb2gray(A);

% Color seperation
[R, G, B] = imsplit(A);


P = cat(3, R, G, B);


FMagR = helper(R);
EdgeR = FMagR./max(max(FMagR));
subplot(2, 2, 1)
imshow(EdgeR);
title('R');

FMagG = helper(G);
EdgeG = FMagG./max(max(FMagG));
subplot(2, 2, 2)
imshow(EdgeG);
title('G')

FMagB = helper(B);
EdgeB = FMagB./max(max(FMagB));
subplot(2, 2, 3)
imshow(EdgeB);
title('B');


res = grs2rgb(EdgeR) + grs2rgb(EdgeG) + grs2rgb(EdgeB);
subplot(2, 2, 4)
imshow(res);
title('Final');


