function sensitivity = sensitivitySweep(extPar)
for j = extPar.numPoints:-1:1    
    for i = 200:-1:1
        extPar = setError(extPar,j);
        pos = setPos(extPar);
        fitness(i) = calcFitnessVerboseV2(pos,extPar);
    end
    absError = transpose([fitness.absError]);
    sensitivity.errAvg(j) = mean(absError);
    sensitivity.errStd(j) = std(absError);
end

end