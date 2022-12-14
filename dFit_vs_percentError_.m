clear
numTrials = 10000;
extPar = init();
%pos = OptimalSolutions.X(:,381);
%pos = OptimalSolutions.X;
% load('2021_06_14_ferretsolutons.mat')
% extPar = OptimalSolutions.par.user.extPar;
% [~,index] = min(OptimalSolutions.F);
% extPar.ferretPos2 = OptimalSolutions.X(:,index);
numSensors = 20;
pos = genPosRand(numSensors,extPar);
%pos = extPar.ferretPos2;
for i = numTrials:-1:1    
    fitness(i) = calcFitnessVerbose(pos,extPar);    
    if mod(i,(numTrials/100)) == 0
        percentRemaining = i*100/numTrials
    end    
end

absError = transpose([fitness.absError]);
dFit = transpose([fitness.dFit]);
gFit = transpose([fitness.g_fit]);
g = transpose([fitness.g]);
dReal = transpose([fitness.dReal]);

figure(1)
nbins = [100 100];
[density,Xedges,Yedges] = histcounts2(log10(abs(dReal)),log10(abs(dFit)),nbins);
histogram2(abs(dReal),abs(dFit),10.^Xedges,10.^Yedges,'FaceColor','flat')
set(gca,'xScale','log');
set(gca,'yScale','log');
xlabel('dFalse generated')
ylabel('dFalse fitted')
axis([1e-30 1e-25 1e-30 1e-25 0 max(max(density))]);
hold on
x1 = logspace(-31,-24,1000);
y1 = x1 + 5e-28;
x2 = logspace(-31,-24,1000);
y2 = x2 - 5e-28;
plot3(x1,y1,zeros(1,numel(x1)),'LineWidth',2)
plot3(x2,y2,zeros(1,numel(x1)),'LineWidth',2)
% patch([1e-30 1e-30 1e-25 1e-25],...
%     [1e-30 1e-30 1e-25 1e-25],...
%     [min(min(density)) max(max(density)) max(max(density)) min(min(density))],...
%     'r','FaceAlpha',0.2)

ind1 = 1;
ind2 = 1;
falseNeg = [];
falsePos = [];
for i = numTrials:-1:1
    if (abs(dReal(i)-dFit(i))>5e-28)&&(abs(dReal(i))>abs(dFit(i)))
        falseNeg(ind1) = dReal(i);
        ind1 = ind1 + 1;
    end
    if (abs(dReal(i)-dFit(i))>5e-28)&&(abs(dReal(i))<abs(dFit(i)))
        falsePos(ind2) = dFit(i);
        ind2 = ind2 + 1;
    end
end

text(1e-27,3e-28,0,sprintf('total fits: %i',numTrials))
text(1e-27,1e-28,0,sprintf('false negatives: %i',length(falseNeg)))
text(1e-27,3e-29,0,sprintf('false positives: %i',length(falsePos)))
text(1e-27,1e-29,0,sprintf('correct dFalse: %i%',100 - 100*(length(falsePos)+length(falseNeg))./numTrials))

figure(2)
[density2,Xedges2,Yedges2] = histcounts2(log10(abs(dReal)),log10(abs(absError)),nbins);
histogram2(abs(dReal),abs(absError),10.^Xedges2,10.^Yedges2,'FaceColor','flat')
set(gca,'xScale','log');
set(gca,'yScale','log');
axis([1e-30 1e-25 1e-30 1e-25 0 max(max(density2))]);
xlabel('dFalse generated')
ylabel('absolute error in fit')

figure(3)
[~,edges] = histcounts(log10(absError));
histogram(absError,10.^edges)
set(gca, 'xscale','log')
xlabel('absolute error (e*cm)');
ylabel('counts');

plotGoodPos(pos,'show')

errAvg = mean(absError)
errStd = std(absError)

% plotGoodPos(pos,'show')