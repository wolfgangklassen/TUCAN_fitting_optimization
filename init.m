function extPar = init()
%This function initializes all the constant parameters and structures that 
%the calcFitness funtion needs whenever it runs.  This is done only once at
%the beginning of the run, and the extPar structure is passed through to
%everything that needs it.
temp = load('C:\Users\wolfy\Matlab\Summer 2020 - copy\Summer 2020 - copy\gMax.mat');
extPar.gMax = temp.gMax;
% temp = load('C:\Users\Wolfgang\Documents\MATLAB\Summer 2020\March_11_ferret.mat');
% extPar.ferretPos1 = temp.OptimalSolutions.X;
temp = load('C:\Users\wolfy\Matlab\Summer 2020 - copy\Summer 2020 - copy\2021_06_08_ferretsolutons_newgeometry.mat');
[~,index] = min(temp.OptimalSolutions.F);
extPar.ferretPos1 = temp.OptimalSolutions.X(:,index);
temp2 = load('C:\Users\wolfy\Matlab\Summer 2020 - copy\Summer 2020 - copy\2021_06_14_ferretsolutons.mat');
[~,index] = min(temp2.OptimalSolutions.F);
extPar.ferretPos2 = temp2.OptimalSolutions.X(:,index);
extPar.fitOrder = 3;
extPar.gOrder = 5;
extPar.fitMode = 'Bmod';%Obvious exits are: "Bz","Bmod","Bvec", and "DENNIS"
extPar.numAverages = 20;

extPar.transField = 1e-3; % units of uT (1e-3 = 1nT) adjust as needed
extPar.fieldError.x = 3e-5; % units of uT (1e-6 = 1pT) adjust as needed
extPar.fieldError.y = 3e-5; % units of uT (1e-6 = 1pT) adjust as needed
extPar.fieldError.z = 1e-6; % units of uT (1e-6 = 1pT) adjust as needed
extPar.fieldError.mod = 50e-6; % units of uT (1e-6 = 1pT) adjust as needed
extPar.posError = 1; % units of cm adjust as needed
extPar.planError = 1; % units of cm adjust as needed
extPar.singlePlanError = 5; % units of cm adjust as needed

extPar.Rcell = 25; % units of cm
extPar.Rvac = 54; % units of cm
extPar.Rmsr = 100; % units of cm
extPar.h1 = 4; % units of cm
extPar.h2 = 16.1; % units of cm
extPar.Hvac = 26.5; % units of cm
extPar.Hmsr = 100; % units of cm