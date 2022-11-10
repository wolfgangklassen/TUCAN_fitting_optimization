function transMat = calcTransMatZFourth(pos)
%calcTransMat takes in a 3-by-numPos matrix of positions, and calculates
%the transformation matrix between the Bz field space and the gradient space.
%This function takes into account positioning errors, parametrized by
%posError.  This version calculates up to fourth order.

x = pos(:,1);
y = pos(:,2);
z = pos(:,3);

transMat = zeros(length(pos),25);
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
transMat(:,12)= 3.*y.*z.^2 - 0.75.*(x.^2.*y + y.^3);%
transMat(:,13) = z.^3 - 1.5.*z.*(x.^2 + y.^2);%
transMat(:,14) = 3.*x.*z.^2 - 0.75.*(x.^3 + x.*y.^2);%
transMat(:,15) = 3.*z.*(x.^2 - y.^2);%
transMat(:,16) = x.^3 - 3.*x.*y.^2;%
transMat(:,17) = 4.*(x.^3).*y - 4.*x.*(y.^3);%
transMat(:,18) = 12.*(x.^2).*y.*z - 4.*(y.^3).*z;%
transMat(:,19) = 2.*x.*y.*(6.*(z.*2) - x.^2 - y.^2);%
transMat(:,20) = 4.*y.*(z.^3) - 3.*(x.^2).*y.*z - 3.*(y.*3).*z;%
transMat(:,21) = z.^4 - 3.*(z.^2).*(x.^2 + y.^2) + ...
    (3/8).*(x.^4 + y.^4) + 0.75.*(x.^2).*(y.^2);%
transMat(:,22) = 4.*x.*z.^3 - 3.*x.^3.*z - 3.*x.*y.^2.*z;%double check this one again
transMat(:,23) = 6.*(z.^2).*(x.^2 - y.*2) + y.^4 - x.^4;%
transMat(:,24) = 4.*(x.^3).*z - 12.*x.*(y.^2).*z;%
transMat(:,25) = y.^4 + x.^4 - 6.*(x.^2).*(y.^2);%

end