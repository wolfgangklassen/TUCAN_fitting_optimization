clearvars;
x = linspace(-80,80,50);
y = linspace(-80,80,50);
z = linspace(-80,80,50);
[X,Y,Z] = ndgrid(x,y,z);
pos = [X(:),Y(:),Z(:)];

transMat(:,:,1) = calcTransMatXFifth(pos); % These should be
transMat(:,:,2) = calcTransMatYFifth(pos); % to the highest
transMat(:,:,3) = calcTransMatZFifth(pos); % order, with errors

for j = 4:1:48
    g = zeros(48,100);
    g(j,:) = logspace(-15,-1,100);
    for i = 1:1:size(g,2)        
        B = calcBfield(transMat,g(:,i));
        maxVar(i) = max(B)-min(B);      
    end
    ind = find(maxVar>3e-3,1,'first');
    gMax(j) = g(j,ind);
    bVar(j) = maxVar(ind);
end
semilogy(gMax)