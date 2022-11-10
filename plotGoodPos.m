function plotGoodPos(goodPos,saveorshow)

numFrames = 90;
filename = 'OptimalSolutions_2021_06_10_bestPos.gif';

if strcmp(saveorshow,'save') && ~strcmp(filename,'temp.gif')
    if isfile(filename)
        error('A file with that name exists in this folder');
    end
end
if strcmp(saveorshow,'save')
    for frameNumber = 1:numFrames
        
        pos = reshape(goodPos,length(goodPos)./3,3);
        %plots the positions of the magnetometers inside a cube
        %generates a cube to define the outer edges of the figure
        fig = figure;
        
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
        scatter3(pos(:,1),pos(:,2),pos(:,3),15,'black','s','filled')
        camzoom(1);
        view([frameNumber*4 (15+10*sin(4*pi*(frameNumber/numFrames)))]);
        drawnow
        frame = getframe(fig);
        im{frameNumber} = frame2im(frame);
        [A,map] = rgb2ind(im{frameNumber},256);
        if frameNumber == 1
            imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',0.1);
        else
            imwrite(A,map,filename,'gif','Writemode','append','DelayTime',0.1);
        end
        close;
    end
elseif strcmp(saveorshow,'show')
    pos = reshape(goodPos,length(goodPos)./3,3);
    %plots the positions of the magnetometers inside a cube
    %generates a cube to define the outer edges of the figure
    fig = figure;
    
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
    scatter3(pos(:,1),pos(:,2),pos(:,3),15,'black','s','filled')
    camzoom(1);
else
    error('Valid second arguments are ''plot'' and  ''save''');
end
end