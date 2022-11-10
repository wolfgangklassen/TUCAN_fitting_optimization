function fitMat = setFitMat(pos)

fitMat(:,:,1) = calcTransMatXFifth(pos);
fitMat(:,:,2) = calcTransMatYFifth(pos);
fitMat(:,:,3) = calcTransMatZFifthFull(pos);

end