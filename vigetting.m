my_img = imread('peppers.png');
[R, C, CH] = size(my_img);
im_img = double(my_img);

CenterPixelX = round((R+1)/2);
CenterPixelY = round((C+1)/2);

M = sqrt((CenterPixelX-1)^2 + (CenterPixelY-1)^2)

subplot(1, 2, 1);
imshow(my_img);

newImage = my_img;

for  i = 1 : R
    for j = 1 : C
        for cha = 1:CH
             D = sqrt(abs(i-CenterPixelX)^2 + abs(j-CenterPixelY)^2);
             factor = abs(1-D/M);
             newImage(i,j,cha) = my_img(i,j,cha)*factor;
        end
    end
end
subplot(1, 2, 2);
imshow(newImage);
