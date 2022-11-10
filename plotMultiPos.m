function plotMultiPos(OptimalSolutions,numToShow)

[~,inds] = mink(OptimalSolutions.F,numToShow);
plotcube([200 200 200],[-100 -100 -100],0);
hold on;
%generate 2 cylinders to represent the regions of interest
r = 25; n = 25;
[X,Y,Z] = cylinder(r,n);
Z(1,:) = 4;
Z(2,:) = 16.1;
surf(X,Y,Z,'FaceAlpha',0.1);

r = 25; n = 25;
[X,Y,Z] = cylinder(r,n);
Z(1,:) = -16.1;
Z(2,:) = -4;
surf(X,Y,Z,'FaceAlpha',0.1);

r = 54; n = 54;
[X,Y,Z] = cylinder(r,n);
Z(1,:) = -26.5;
Z(2,:) = 26.5;
surf(X,Y,Z,'FaceAlpha',0.1);

for i = 1:numToShow
    
    pos = reshape(OptimalSolutions.X(:,inds(i)),length(OptimalSolutions.X(:,inds(i)))./3,3);
    %plots the positions of the magnetometers inside a cube
    scatter3(pos(:,1),pos(:,2),pos(:,3),15,'black','s','filled')%,'MarkerFaceAlpha',.1,'MarkerEdgeAlpha',.1)
    camzoom(1);
    drawnow

end