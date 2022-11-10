function transMat = calcTransMatXZeroth(pos)
%calcTransMat takes in a 3-by-numPos matrix of positions, and calculates
%the transformation matrix between the Bz field space and the gradient space.
%This function takes into account positioning errors, parametrized by
%posError.  This version calculates up to first order.

x = pos(:,1);
y = pos(:,2);
z = pos(:,3);

transMat = zeros(size(pos,1),3);
transMat(:,1) = 0;%
transMat(:,2) = 0;%
transMat(:,3) = 1;%

end