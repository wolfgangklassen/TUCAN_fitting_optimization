function dFit = calcdFit(extPar,fitness)

switch extPar.fitMode
    case {'Bz','Bmod'}
        dFit = calcdFalse(extPar,fitness);
    case 'Bvec'
        switch extPar.fitOrder
            case 1
                dFit = calcdFalseFirstReal(extPar.Rcell,extPar.h1,extPar.h2,fitness.g_fit);
            case 2
                dFit = calcdFalseSecondReal(extPar.Rcell,extPar.h1,extPar.h2,fitness.g_fit);
            case 3
                dFit = calcdFalseThirdReal(extPar.Rcell,extPar.h1,extPar.h2,fitness.g_fit);
            case 4
                dFit = calcdFalseFourthReal(extPar.Rcell,extPar.h1,extPar.h2,fitness.g_fit);
            case 5
                dFit = calcdFalseFifthReal(extPar.Rcell,extPar.h1,extPar.h2,fitness.g_fit);
        end
end

end