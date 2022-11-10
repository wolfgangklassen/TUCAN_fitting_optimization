function transMat = calcTransMatZThirdFull(pos)
%calcTransMat takes in a 3-by-numPos matrix of positions, and calculates
%the trans. matrix between the Bz field space and the gradient space.
%This version calculates up to third order.  This version is for
%calculating the real field to third order, so expects the full 24-term
%third order g vector, not the shorter 16 term one.
x = pos(:,1);
y = pos(:,2);
z = pos(:,3);
transMat = zeros(size(pos,1),24);
transMat(:,1) = 0;
transMat(:,2) = 1;%
transMat(:,3) = 0;
transMat(:,4) = 0;
transMat(:,5) = y;%
transMat(:,6) = z;%
transMat(:,7) = x;%
transMat(:,8) = 0;
transMat(:,9) = 0;
transMat(:,10) = 2.*x.*y;%
transMat(:,11) = 2.*y.*z;%
transMat(:,12) = z.^2 - 0.5.*(x.^2 + y.^2);%
transMat(:,13) = 2.*x.*z;%
transMat(:,14) = x.^2 - y.^2;%
transMat(:,15) = 0;
transMat(:,16) = 0;
transMat(:,17) = 3.*x.^2.*y - y.^3;%
transMat(:,18) = 6.*x.*y.*z;%
transMat(:,19) = 3.*y.*z.^2 - 0.75.*(x.^2.*y + y.^3);%
transMat(:,20) = z.^3 - 1.5.*z.*(x.^2 + y.^2);%
transMat(:,21) = 3.*x.*z.^2 - 0.75.*(x.^3 + x.*y.^2);%
transMat(:,22) = 3.*z.*(x.^2 - y.^2);%
transMat(:,23) = x.^3 - 3.*x.*y.^2;%
transMat(:,24) = 0;
end