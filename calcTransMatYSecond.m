function transMat = calcTransMatYSecond(pos)
%calcTransMat takes in a 3-by-numPos matrix of positions, and calculates
%the transformation matrix between the Bz field space and the gradient space.
%This function takes into account positioning errors, parametrized by
%posError.  This version calculates up to second order.

x = pos(:,1);
y = pos(:,2);
z = pos(:,3);

transMat = zeros(size(pos,1),15);
transMat(:,1) = 1;%
transMat(:,2) = 0;%
transMat(:,3) = 0;%

transMat(:,4) = x;%
transMat(:,5) = z;%
transMat(:,6) = -0.5*y;%
transMat(:,7) = 0;%
transMat(:,8) = -y;%

transMat(:,9) = x.^2 - y.^2;%
transMat(:,10) = 2.*x.*z;
transMat(:,11) = -0.25.*(x.^2 + 3.*y.^2 - 4.*z.^2);
transMat(:,12) = -y.*z;%
transMat(:,13) = -0.5.*x.*y;%
transMat(:,14) = -2.*y.*z;%
transMat(:,15) = -2.*x.*y;%

end