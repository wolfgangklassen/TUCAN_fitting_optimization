function transMat = calcTransMatZFifth(pos)
%calcTransMat takes in a 3-by-numPos matrix of positions, and calculates
%the trans. matrix between the Bz field space and the gradient space.
%This version calculates up to fifth order.
x = pos(:,1);
y = pos(:,2);
z = pos(:,3);
transMat = zeros(length(pos),36);
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
transMat(:,17) = 4.*(x.^3).*y - 4.*x.*(y.^3);%
transMat(:,18) = 12.*(x.^2).*y.*z - 4.*(y.^3).*z;%
transMat(:,19) = 2.*x.*y.*(6.*(z.^2) - x.^2 - y.^2);%
transMat(:,20) = 4.*y.*(z.^3) - 3.*(x.^2).*y.*z - 3.*(y.^3).*z;%
transMat(:,21) = z.^4 - 3.*(z.^2).*(x.^2 + y.^2) + ...
    (3/8).*(x.^4 + y.^4) + 0.75.*(x.^2).*(y.^2);%
transMat(:,22) = 4.*x.*z.^3 - 3.*x.^3.*z - 3.*x.*y.^2.*z;%
transMat(:,23) = 6.*(z.^2).*(x.^2 - y.^2) + y.^4 - x.^4;%
transMat(:,24) = 4.*(x.^3).*z - 12.*x.*(y.^2).*z;%
transMat(:,25) = y.^4 + x.^4 - 6.*(x.^2).*(y.^2);%
transMat(:,26) = y.^5 + 5.*(x.^4).*y - 10.*(x.^2).*(y.^3);%
transMat(:,27) = 20.*x.*y.*z.*(x.^2 - y.^2);%
transMat(:,28) = 30.*(x.^2).*y.*(z.^2) - (15/4).*(x.^4).*y - ...
    (5/2).*(x.^2).*(y.^3) - 10.*(y.^3).*(z.^2) + (5/4).*(y.^5);%
transMat(:,29) = 10.*x.*y.*z.*(2.*(z.^2) - x.^2 - y.^2);%
transMat(:,30) = 5.*y.*(z.^4) - (15/2).*(x.^2).*y.*(z.^2) - ...
    (15/2).*(y.^3).*(z.^2) + (5/8).*(x.^4).*y + (5/8).*(y.^5) + ...
    (5/4).*(x.^2).*(y.^3);%
transMat(:,31) = z.^5 - 5.*(x.^2).*(z.^3) - 5.*(y.^2).*(z.^3) + ...
    (15/8).*(x.^4).*z + (15/8).*(y.^4).*z + (15/4).*(x.^2).*(y.^2).*z;%
transMat(:,32) = 5.*x.*(z.^4) - (15/2).*(x.^3).*(z.^2) - ...
    (15/2).*x.*(y.^2).*(z.^2) + (5/8).*(x.^5) + (5/8).*x.*(y.^4) + ...
    (5/4).*(x.^3).*(y.^2);%
transMat(:,33) = 10.*(z.^3).*(x.^2 - y.^2) + 5.*z.*(y.^4 - x.^4);%
transMat(:,34) = 10.*(x.^3).*(z.^2) - (5/4).*(x.^5) + ...
    2.5.*(x.^3).*(y.^2) - 30.*x.*(y.^2).*(z.^2) + (15/4).*x.*(y.^4);%
transMat(:,35) = 5.*z.*(y.^4 + x.^4 - 6.*(x.^2).*(y.^2));%
transMat(:,36) = x.^5 - 10.*(x.^3).*(y.^2) + 5.*x.*(y.^4);%
end