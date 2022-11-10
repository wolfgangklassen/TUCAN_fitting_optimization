clear;
load('D:\Documents - Terry\MATLAB\UofMdata\March_11_ferret.mat')
numTrials = 500;
extPar = init();
%pos = genPos;
%pos = OptimalSolutions.X;
%extPar = OptimalSolutions.par.user.extPar;
numSensors = 2;
numPoints = 50;
tempErr = logspace(-5,5,numPoints);
for j = numPoints:-1:1
    extPar.transField = tempErr(j);
    for i = numTrials:-1:1
        pos = 160*rand(numSensors.*3,1)-80;
        fitness(i) = calcFitnessVerboseV2(pos,extPar);
    end
    if mod(j,(numPoints/100)) == 0
        percentRemaining = j*100/numPoints
    end
    dFit = transpose([fitness.dFit]);
    dReal = transpose([fitness.dReal]);
    absError = transpose([fitness.absError]);
    gFit = transpose([fitness.g_fit]);
    g = transpose([fitness.g]);
    errAvg(j) = mean(absError);
    errStd(j) = std(absError);   
end
errorbar(tempErr,errAvg,errStd)
set(gca,'xScale','log');
set(gca,'yScale','log');
title(['dFalse error vs B measure sigma for ' num2str(numSensors) ' sensors']);
xlabel('B measure sigma [uT]');
ylabel('dFalse error [e*cm]');