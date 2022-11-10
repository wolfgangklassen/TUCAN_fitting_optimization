function transMat = calcTransMatZFourthFull(pos)
%calcTransMat takes in a 3-by-numPos matrix of positions, and calculates
%the transformation matrix between the Bz field space and the gradient space.
%This function takes into account positioning errors, parametrized by
%posError.  This version calculates up to fourth order.

x = pos(:,1);
y = pos(:,2);
z = pos(:,3);

transMat = zeros(size(pos,1),35);
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

transMat(:,16) = 0;%
transMat(:,17) = 3.*x.^2.*y - y.^3;%
transMat(:,18) = 6.*x.*y.*z;%
transMat(:,19) = 3.*y.*z.^2 - 0.75.*(x.^2.*y + y.^3);%
transMat(:,20) = z.^3 - 1.5.*z.*(x.^2 + y.^2);%
transMat(:,21) = 3.*x.*z.^2 - 0.75.*(x.^3 + x.*y.^2);%
transMat(:,22) = 3.*z.*(x.^2 - y.^2);%
transMat(:,23) = x.^3 - 3.*x.*y.^2;%
transMat(:,24) = 0;%

transMat(:,25) = 0;%
transMat(:,26) = 4.*(x.^3).*y - 4.*x.*(y.^3);%
transMat(:,27) = 12.*(x.^2).*y.*z - 4.*(y.^3).*z;%
transMat(:,28) = 2.*x.*y.*(6.*(z.*2) - x.^2 - y.^2);%
transMat(:,29) = 4.*y.*(z.^3) - 3.*(x.^2).*y.*z - 3.*(y.*3).*z;%
transMat(:,30) = z.^4 - 3.*(z.^2).*(x.^2 + y.^2) + ...
    (3/8).*(x.^4 + y.^4) + 0.75.*(x.^2).*(y.^2);%
transMat(:,31) = 4.*x.*z.^3 - 3.*x.^3.*z - 3.*x.*y.^2.*z;%double check this one again
transMat(:,32) = 6.*(z.^2).*(x.^2 - y.*2) + y.^4 - x.^4;%
transMat(:,33) = 4.*(x.^3).*z - 12.*x.*(y.^2).*z;%
transMat(:,34) = y.^4 + x.^4 - 6.*(x.^2).*(y.^2);%
transMat(:,35) = 0;%
end