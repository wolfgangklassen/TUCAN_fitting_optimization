function dFalse = calcdFalse(extPar,fitness)

switch extPar.fitOrder
    case 1
        dFalse = calcdFalseFirst(extPar.Rcell,extPar.h1,extPar.h2,fitness.g_fit);
    case 2
        dFalse = calcdFalseSecond(extPar.Rcell,extPar.h1,extPar.h2,fitness.g_fit);
    case 3
        dFalse = calcdFalseThird(extPar.Rcell,extPar.h1,extPar.h2,fitness.g_fit);
    case 4
        dFalse = calcdFalseFourth(extPar.Rcell,extPar.h1,extPar.h2,fitness.g_fit);
    case 5
        dFalse = calcdFalseFifth(extPar.Rcell,extPar.h1,extPar.h2,fitness.g_fit);
end


end