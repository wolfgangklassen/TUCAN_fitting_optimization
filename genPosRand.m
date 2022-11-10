function pos = genPosRand(numPos,extPar)
for i = numPos:-1:1
    r = extPar.Rvac;
    while r>=extPar.Rvac
        x = extPar.Rvac.*(rand.*2-1);
        y = extPar.Rvac.*(rand.*2-1);
        r = sqrt(x.^2 + y.^2);
    end
    z = 0;
    while abs(z)<=extPar.Hvac
        z = 0.5*extPar.Hmsr.*(2.*rand-1);
    end
    pos(i,:) = [x,y,z];
end
pos = reshape(pos,numel(pos),1);
end