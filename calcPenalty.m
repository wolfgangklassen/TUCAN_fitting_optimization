function penalty = calcPenalty(pos,extPar)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%this function calculates the penalty due to being inside the central
%keepout zone.
penalty = 0;
x = 0;
rho = sqrt(pos(1).^2 + pos(2).^2);%put into cylindrical coordinates
z = pos(3);
if rho > extPar.Rvac
    x = rho - extPar.Rvac;%pushes sensors towards middle
else
    x = extPar.Hvac - abs(z);%pushes sensors up/down out of chamber
end
penalty = x.^4;
end