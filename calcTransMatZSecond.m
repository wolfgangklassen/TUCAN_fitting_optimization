function transMat = calcTransMatZSecond(pos)
%calcTransMat takes in a 3-by-numPos matrix of positions, and calculates
%the transformation matrix between the Bz field space and the gradient space.
%This function takes into account positioning errors, parametrized by
%posError.  This version calculates up to second order.

x = pos(:,1);
y = pos(:,2);
z = pos(:,3);

transMat = zeros(size(pos,1),9);

transMat(:,1) = 1;%
transMat(:,2) = y;%
transMat(:,3) = z;%
transMat(:,4) = x;%
transMat(:,5) = 2.*x.*y;%
transMat(:,6) = 2.*y.*z;%
transMat(:,7) = z.^2 - 0.5.*(x.^2 + y.^2);%
transMat(:,8) = 2.*x.*z;%
transMat(:,9) = x.^2 - y.^2;%

end