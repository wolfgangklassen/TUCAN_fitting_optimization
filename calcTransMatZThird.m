function transMat = calcTransMatZThird(pos)
%calcTransMat takes in a 3-by-numPos matrix of positions, and calculates
%the trans. matrix between the Bz field space and the gradient space.
%This version calculates up to third order.  In order for
%calcGrad to solve for g_fit, which excludes the zero modes in z, this
%version also excludes the zero modes.  This shouldn't effect the higher
%order versions which calculate the full field.
x = pos(:,1);
y = pos(:,2);
z = pos(:,3);
transMat = zeros(length(pos),16);
transMat(:,1) = 1;%
transMat(:,2) = y;%
transMat(:,3) = z;%
transMat(:,4) = x;%
transMat(:,5) = 2.*x.*y;%
transMat(:,6) = 2.*y.*z;%
transMat(:,7) = z.^2 - 0.5.*(x.^2 + y.^2);%
transMat(:,8) = 2.*x.*z;%
transMat(:,9) = x.^2 - y.^2;%
transMat(:,10) = 3.*x.^2.*y - y.^3;%
transMat(:,11) = 6.*x.*y.*z;%
transMat(:,12) = 3.*y.*z.^2 - 0.75.*(x.^2.*y + y.^3);%
transMat(:,13) = z.^3 - 1.5.*z.*(x.^2 + y.^2);%
transMat(:,14) = 3.*x.*z.^2 - 0.75.*(x.^3 + x.*y.^2);%
transMat(:,15) = 3.*z.*(x.^2 - y.^2);%
transMat(:,16) = x.^3 - 3.*x.*y.^2;%
end