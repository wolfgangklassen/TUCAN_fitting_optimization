function myPlot(X,F,extPar)

[~,index] = min(F);
goodPos = X(:,index);
pos = reshape(goodPos,length(goodPos)./3,3);

plotcube([200 200 200],[-100 -100 -100],0);hold on
%plotcube([100 100 200],[0 0 -100],0.1);
r = 54; n = 50;
[X,Y,Z] = cylinder(r,n);
Z(1,:) = -26.5;
Z(2,:) =  26.5;
surf(X,Y,Z,'FaceAlpha',0.1);
scatter3(pos(:,1),pos(:,2),pos(:,3),15,'black','s','filled');
zoom(1);
hold off
end