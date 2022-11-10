function transMat = calcTransMatZZeroth(pos)
%calcTransMat takes in a 3-by-numPos matrix of positions, and calculates
%the transformation matrix between the Bz field space and the gradient space.
%This function takes into account positioning errors, parametrized by
%posError.  This version calculates up to first order.

x = pos(:,1);
y = pos(:,2);
z = pos(:,3);

transMat = zeros(size(pos,1),1);

transMat(:,1) = 1;%

end