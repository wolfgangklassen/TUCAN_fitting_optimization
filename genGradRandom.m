function g = genGradRandom(extPar)
%generates a random gradient vector, with values large enough to have a
%1e-27 dFalse contribution.  Units are microtesla/cm^(ell), where ell is
%the degree of the polynomial associated with the gradient term.
%values are generated to be on the order of the largest gradients we might
%expect to encounter, as caluated using 3 nT variation in the volume.
for i = 48:-1:4
    g(i) = (2*rand - 1)*extPar.gMax(i);
end
g(1) = randn*extPar.transField;%sets transverse fields to some amount
g(3) = randn*extPar.transField;%relative to extPar.transField
g(2) = 1;%Bz set to 1 uT
g = g';

switch extPar.gOrder
    case 1
        g(9:end) = [];
    case 2
        g(16:end) = [];
    case 3
        g(25:end) = [];
    case 4
        g(36:end) = [];
    case 5
        %do nothing
end


end