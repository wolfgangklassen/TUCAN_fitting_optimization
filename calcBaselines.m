function baselines = calcBaselines(pos)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%generates a list of the distances between each pair of points in a given
%array.  Input is a (numPoints,3) array of position values.  Output is a
%(n(n+1)/2,1) list of values.
baselines = [];
posTemp = pos;
for i = length(pos):-1:1    
    posTemp(i,:) = [];
    baselines = [baselines;...
        sqrt((pos(i,1)-posTemp(:,1)).^2+(pos(i,2)-posTemp(:,2)).^2+...
        (pos(i,3)-posTemp(:,3)).^2)];
end
end