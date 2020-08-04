

function T = oldphoto(ImageEm)
    
    [r, g, b] = separateChannel(ImageEm);
    
    newRed = (r * .393) + (g * .769) + (b * .189);
    newGreen = (r * .349) + (g * .686) + (b * .168);
    newBlue = (r * .272) + (g * .534) + (b * .131);
    
    
    T = cat(3, newRed, newGreen, newBlue);
end

function [r, g, b] = separateChannel(I)
    r = I(:, :, 1);
    g = I(:, :, 2);
    b = I(:, :, 3);
end
