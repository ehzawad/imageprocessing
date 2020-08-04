
function T = oldphoto(ImageEm)
    oldRedChannel = ImageEm(:, :, 1);
    oldGreenChannel = ImageEm(:, :, 2);
    oldBlueChannel = ImageEm(:, :, 3);
    
    newRed = (oldRedChannel * .393) + (oldGreenChannel * .769) + (oldBlueChannel * .189);
    newGreen = (oldRedChannel * .349) + (oldGreenChannel * .686) + (oldBlueChannel * .168);
    newBlue = (oldRedChannel * .272) + (oldGreenChannel * .534) + (oldBlueChannel * .131);
    
    T = cat(3, newRed, newGreen, newBlue);
end


