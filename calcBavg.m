function Bavg = calcBavg(extPar,pos,g)
%calcBavg returns the average Bfield over the input points "pos" for a
%given magnetic field described by "g".  This is typically used with a
%single position input unless averaging over the vloume of a Cs cell.
%March 31: added ability to specify order of calculation
switch extPar.gOrder
    case 1
        transMat(:,:,1) = calcTransMatXFirst(pos); % These should be
        transMat(:,:,2) = calcTransMatYFirst(pos); % to the highest
        transMat(:,:,3) = calcTransMatZFirstFull(pos); % order, with errors
    case 2
        transMat(:,:,1) = calcTransMatXSecond(pos); % These should be
        transMat(:,:,2) = calcTransMatYSecond(pos); % to the highest
        transMat(:,:,3) = calcTransMatZSecondFull(pos); % order, with errors
    case 3
        transMat(:,:,1) = calcTransMatXThird(pos); % These should be
        transMat(:,:,2) = calcTransMatYThird(pos); % to the highest
        transMat(:,:,3) = calcTransMatZThirdFull(pos); % order, with errors
    case 4
        transMat(:,:,1) = calcTransMatXFourth(pos); % These should be
        transMat(:,:,2) = calcTransMatYFourth(pos); % to the highest
        transMat(:,:,3) = calcTransMatZFourthFull(pos); % order, with errors
    case 5
        transMat(:,:,1) = calcTransMatXFifth(pos); % These should be
        transMat(:,:,2) = calcTransMatYFifth(pos); % to the highest
        transMat(:,:,3) = calcTransMatZFifthFull(pos); % order, with errors
end

Bfield = calcBfield(extPar,transMat,g);
Bavg = mean(Bfield);
end