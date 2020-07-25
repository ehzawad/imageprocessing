im = imread('peppers.png');
imgray = rgb2gray(im)

im = double(imgray);
im_thresholding = im;

for  i = 1 : size(imgray, 1)
    for j = 1 : size (imgray, 2)
        pixel = imgray(i, j);
        if imgray(i,j) > 100

            im_thresholding(i, j) = 255;
        else
            im_thresholding(i, j) = pixel .* (im_thresholding(i,j) - pixel) ./ (im_thresholding(i,j).^2);
        end
    end
end

subplot(1, 2, 1)
imshow(mat2gray(im_thresholding))
