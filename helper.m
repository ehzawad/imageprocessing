function f = helper(C)

Gx = double([-1 0 1;-2 0 2; -1 0 1]);
Gx=rot90(Gx,2);

Gy = double([-1 -2 -1; 0 0 0; 1 2 1]);
Gy=rot90(Gy,2);

I = C;

[r,c]=size(I);

Fx = zeros(r,c);
Fy = zeros(r,c);

I = padarray(I,[1 1]);

I = double(I);

for i=2:r-1
     for j=2:c-1
        Fx(i,j)=sum(sum(Gx.*I(i-1:i+1,j-1:j+1)));
              Fy(i,j)=sum(sum(Gy.*I(i-1:i+1,j-1:j+1)));
    end
end



FMag=mat2gray(sqrt(Fx.^2+Fy.^2));
f = FMag;

end