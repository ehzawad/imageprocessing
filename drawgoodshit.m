
img = imread('peppers.png');

img =double(rgb2gray(img));

Gx = double([-1 0 1;-2 0 2; -1 0 1]);
Gx=rot90(Gx,2);

Gy = double([-1 -2 -1; 0 0 0; 1 2 1]);
Gy=rot90(Gy,2);

I= img;

[r,c]=size(I);

Fx = zeros(r,c);
Fy = zeros(r,c);

I = padarray(I,[1 1]);

for i=2:r-1
     for j=2:c-1
        Fx(i,j)=sum(sum(Gx.*I(i-1:i+1,j-1:j+1)));
              Fy(i,j)=sum(sum(Gy.*I(i-1:i+1,j-1:j+1)));
    end
end


img=uint8(img);
FMag=mat2gray(sqrt(Fx.^2+Fy.^2));


subplot(2, 2, 1)
imshow(img);
title('Original Image');

% subplot(2, 2, 2)
% imshow((abs(Fx))./max(max(Fx)));
% title('Gradient in X direction');
%
% subplot(2, 2, 3)
% imshow(abs(Fy)./max(max(Fy)));
% title('Gradient in Y direction');

subplot(2, 2, 3)
imshow(FMag./max(max(FMag)));
title('Gradient Magnitude');

im = FMag;

out = zeros(size(im));
n = 5;
%filter = (1/(n*n))*ones(n,n);
sigma = .1;
filter = fspecial('gaussian',[n,n],sigma);



for row =  ceil(n/2): size(im,1) - floor(n/2)
for col = ceil(n/2) : size(im,2) - floor(n/2)

        temp1 = row - 2;
        temp2 = col - 2;
        sub_block = im(temp1:temp1 + n-1,temp2:temp2 + n-1);

        val = sum(sum(sub_block .* filter));

        M = sub_block(:);
        val = median(M);


        out(row,col) = val;

    end
 end
k = 5;
out2 = im + k*(im - out);

disp(out2);


out3 = 1 - out2;


subplot(2, 2, 4)
imshow(out3);
title('draw');

