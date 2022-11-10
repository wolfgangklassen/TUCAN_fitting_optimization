function transMat = calcTransMatZSecondFull(pos)
%calcTransMat takes in a 3-by-numPos matrix of positions, and calculates
%the transformation matrix between the Bz field space and the gradient space.
%This function takes into account positioning errors, parametrized by
%posError.  This version calculates up to second order.

x = pos(:,1);
y = pos(:,2);
z = pos(:,3);

transMat = zeros(size(pos,1),15);

transMat(:,1) = 0;%
transMat(:,2) = 1;%
transMat(:,3) = 0;%

transMat(:,4) = 0;%
transMat(:,5) = y;%
transMat(:,6) = z;%
transMat(:,7) = x;%
transMat(:,8) = 0;%

transMat(:,9) = 0;%
transMat(:,10) = 2.*x.*y;%
transMat(:,11) = 2.*y.*z;%
transMat(:,12) = z.^2 - 0.5.*(x.^2 + y.^2);%
transMat(:,13) = 2.*x.*z;%
transMat(:,14) = x.^2 - y.^2;%
transMat(:,15) = 0;%
end