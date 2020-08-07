function res = grs2rgb(img, map)

if nargin<1
	error('grs2rgb:missingImage','Specify the name or the matrix of the image');
end
if ~exist('map','var') || isempty(map)
	map = hot(64);
end
[l,w] = size(map);
if w~=3
	error('grs2rgb:wrongColormap','Colormap matrix must contain 3 columns');
end
if ischar(img)
	a = imread(img);
elseif isnumeric(img)
	a = img;
else
	error('grs2rgb:wrongImageFormat','Image format: must be name or matrix');
end
% Calculate the indices of the colormap matrix
a = double(a);
a(a==0) = .0000000000000001; % Needed to produce nonzero index of the colormap matrix
ci = ceil(l*a/max(a(:))); 
% Colors in the new image
[il,iw] = size(a);
r = zeros(il,iw); 
g = zeros(il,iw);
b = zeros(il,iw);
r(:) = map(ci,1);
% g(:) = map(ci,2);
% b(:) = map(ci,3);
% New image
res = zeros(il,iw,3);
res(:,:,1) = r; 
res(:,:,2) = g; 
res(:,:,3) = b;