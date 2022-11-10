function fitness = calcFitnessVerbose(Xtemp,extPar)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%this function takes in a single set of positions and calculates how well
%it can extract dFalse from a randomly generated gradient vector.  This is
%for use in dfitVSdsim, not Ferret.
ideal = reshape(Xtemp,length(Xtemp)./3,3);
% penalty = 0;%always starts at zero penalty
% auxOutput(model).penalty = false;
% for i = 1:length(ideal(:,1))
%     if isPenalty(ideal(i,:),extPar) % checks if each position is penalizable
%         penalty = penalty + calcPenalty(ideal(i,:),extPar);
%         auxOutput(model).penalty = true; % sets penalized flag to true if
%         %even one position is penalized
%     end
% end
baselines = calcBaselines(ideal);%calculates the distance between each set of
%points in the position set
if min(baselines)<3%punishes ferret for overlapping positions by 3 cm
    penalty = penalty + (3-min(baselines)).^2;
    auxOutput(model).penalty = true;
end

for i = extPar.numAverages:-1:1
    %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %This section adds differences between what we SHOULD be implenting and
    %what we THINK we're implementing.  I call these PLANNING errors.
    %Each position can be on average disturbed away from ideal, or a single
    %random one can.
    posTemp = calcPosErrors(ideal,extPar.planError);
    posTemp2 = calcPosErrors(ideal,extPar.singlePlanError);
    pos = posTemp;%ALL POSITIONS DEVIATED FROM IDEAL
    ind = randi(size(Xtemp,1)./3,1);%SINGLE POSITION DEVIATED FROM IDEAL
    pos(ind,:) = posTemp2(ind,:);
    %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    fitMat = setFitMat(pos);  %uses planned positions
    posErrors = calcPosErrors(pos,extPar.posError); %calculates real positions
    fitness.g = genGradRandom(extPar);%generate random gradient
    fitness.dReal = calcdFalseReal(extPar,fitness);
    for j = size(posErrors,1):-1:1%cal
        Bfield(j) = calcB(extPar,posErrors(j,:),fitness.g);
    end
    fitness.g_fit = calcGrad(extPar,Bfield,fitMat);
    fitness.dFit = calcdFit(extPar,fitness); %truncated order
    fitness.absError = abs(fitness.dFit - fitness.dReal);%goal is for this to be as
    %low as possible for any arbitrary g
end
end