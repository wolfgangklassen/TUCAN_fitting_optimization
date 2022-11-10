function dFalse = calcdFalseReal(extPar,fitness)

switch extPar.gOrder
    case 1
        dFalse = calcdFalseFirstReal(extPar.Rcell,extPar.h1,extPar.h2,fitness.g);
    case 2
        dFalse = calcdFalseSecondReal(extPar.Rcell,extPar.h1,extPar.h2,fitness.g);
    case 3
        dFalse = calcdFalseThirdReal(extPar.Rcell,extPar.h1,extPar.h2,fitness.g);
    case 4
        dFalse = calcdFalseFourthReal(extPar.Rcell,extPar.h1,extPar.h2,fitness.g);
    case 5
        dFalse = calcdFalseFifthReal(extPar.Rcell,extPar.h1,extPar.h2,fitness.g);
end

end