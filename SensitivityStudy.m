clear;
%numPoints must be set in init()
extPar = init();
extPar.fitOrder = 3;
extPar.gOrder = 5;
extPar.fitMode = 'Bmod';
extPar.sweepErr = 'pos';%'modErr','zErr','vecErr','posErr','pos','transField'
%extPar.posMode = 'rand';
err = ["vecErr","vecErr","zErr","zErr","modErr","modErr"];
%mode = ["Bvec","Bvec","Bz","Bz","Bmod","Bmod"];
sweep = [17,26,37,20,20];
order = [3,4,5,3,3];
pos = ["rand","rand","rand","ferret1","ferret2"];

for i = 1:size(sweep,2)
    i
    %    extPar.fitMode = mode(i);
    extPar.posMode = pos(i);
    extPar.numSensors = sweep(i);
    %     extPar.sweepErr = err(i);
    extPar.fitOrder = order(i);
    %     extPar.gOrder = sweep(i);
    sensitivity(i) = sensitivitySweep(extPar);
end

switch extPar.sweepErr
    case 'modErr'
        tempErr = extPar.fieldErrList;
        xlab = 'B measure sigma [uT]';
        plotTitle = 'dFalse error vs B mod measure sigma';
    case 'vecErr'
        tempErr = extPar.fieldErrList;
        xlab = 'Bx=By=Bz measure sigma [uT]';
        plotTitle = 'dFalse error vs Bx=By=Bz measure sigma';
    case 'pos'
        tempErr = extPar.posErrList;
        xlab = 'x=y=z sigma [cm]';
        plotTitle = 'dFalse error vs x=y=z sigma';
    case 'transField'
        tempErr = extPar.transFieldList;
        xlab = 'B trans sigma [uT]';
        plotTitle = 'dFalse error vs B trans sigma';
end

errorbar(tempErr,sensitivity(1).errAvg,sensitivity(1).errStd,'DisplayName',num2str(sweep(1)))
set(gca,'xScale','log');
set(gca,'yScale','log');
title(plotTitle)
xlabel(xlab);
ylabel('dFalse error [e*cm]');
hold on;
for i = 2:size(sweep,2)
    errorbar(tempErr,sensitivity(i).errAvg,sensitivity(i).errStd,'DisplayName',num2str(sweep(i)))
    set(gca,'xScale','log');
    set(gca,'yScale','log');
end
hold off;
legend