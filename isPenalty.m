function isPenalty = isPenalty(pos,extPar)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calculates if a position should be penalized for being inside the central
%keepout zone.
rho = sqrt(pos(1).^2 + pos(2).^2);
z = pos(3);
if rho >= extPar.Rvac
    isPenalty = true;
elseif abs(z) <= extPar.Hvac
    isPenalty = true;
elseif abs(z) >= extPar.Hmsr
    isPenalty = true;    
else
    isPenalty = false;
end
end