function extPar = setError(extPar,j)

switch extPar.sweepErr
    case 'modErr'
        extPar.fieldError.mod = extPar.fieldErrList(j);
    case 'zErr'
        extPar.fieldError.z = extPar.fieldErrList(j);
    case 'vecErr'
        extPar.fieldError.x = extPar.fieldErrList(j);
        extPar.fieldError.y = extPar.fieldErrList(j);
        extPar.fieldError.z = extPar.fieldErrList(j);
    case 'transErr'
        extPar.fieldError.x = extPar.fieldErrList(j);
        extPar.fieldError.y = extPar.fieldErrList(j);
    case 'pos'
        extPar.posError = extPar.posErrList(j);
    case 'transField'
        extPar.transField = extPar.transFieldList(j);
end

end