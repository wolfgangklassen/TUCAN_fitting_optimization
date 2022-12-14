%
% Qubist 5: A Global Optimization, Modeling & Visualization Toolbox for MATLAB
%
% Ferret: A Multi-Objective Linkage-Learning Evolutionary optimizer
% Locust: A Multi-Objective Particle Swarm Optimizer
% Anvil: A Multi-Objective Simulated Annealing/Genetic Algorithm Hybrid
% SAMOSA: Simple Approach to a Multi-Objective Simplex Algorithm
%
% Copyright 2002-2016. nQube Data Science Inc. All rights reserved.
% Author: Jason D. Fiege, Ph.D.
% design.innovate.optimize @ www.nQube.com
% ============================================================================

function par=FerretSetup(par)
% Template containing BASIC setup parameters.  See also defaultFerretSetup.
% 
% ====================================
% User-defined parameters & output
par.user.fitnessFcn='fitness'; % [string]: Name of the fitness function.
%
% ====================================
% History
par.history.NGenPerHistoryFile=25; % [integer >= 1]: How many generations per History file?
%
% ====================================
% General
par.general.NPop=2; % [integer >= 1]: Number of populations.
par.general.popSize=250; % [integer >= 1]: Size of each population.
par.general.NGen=10000; % [integer >= 1]: Maximum number of generations to run for.
par.general.min=ones(1,25*3)*(-100); % [real vector]: Minimum values of all parameters.
par.general.max=ones(1,25*3)*(100); % [real vector]: Maximum values of all parameters.
par.general.XLabels={}; % [Cell array of strings]: Give names to some or all parameters: {'A','B',...}
par.general.FLabels={}; % [Cell array of Astrings]: Give names to some or all fitness values: {'FA','FB',...}
par.general.noisy = 1;
par.parallel.timeout = 5000;
%
% ====================================
% Competition
par.selection.PTournament=1; % [0 - 1]: Natural selection: probability that each individual will compete.
par.selection.pressure=1; % [0 - 1]: Natural selection pressure on overall fitness.
par.selection.PPreferSuperiorMates=0.5; % [0 - 1]: Sexual selection: probability that individuals prefer superior mates during XOver.
%
% ====================================
% Mutation
par.mutation.PMutate=0.1; % [0 - 1]: Probability of mutation.
par.mutation.scale=0.2; % [0 - 1]: Min & max scale of mutation.
%
% ====================================
% Crossover
par.XOver.PXOver=1;  % [0 - 1]: Probability of X-Type crossovers.
% par.XOver.strength=0.5; % [0 - 1]: Scale of crossover.
%
par.link.PLink=0;
par.link.FAbsTol=0;
par.link.FRelTol=0;
par.link.FRankTol=0;
par.link.PRandomizeNewBBs=0;
% ====================================
% Building Block Crossover
% par.XOverBB.PXOver=1; % [0 - 1]: Probability of Building Block crossovers.
% par.XOverBB.multiBB=false; % [logical]: Single or multiple BB XOver?
%
% ====================================
% Niching
par.niching.mergeMetric='combine'; % [string: 'combine' (default) or 'Pareto']: Method to combine niching in P, X, and F spaces.
par.niching.P=0;  % [0 - 1]: Pattern niching: Typically ~0.5 is about right.
par.niching.X=0;  % [0 - 1]: X-Niching: Typically ~0.25 is about right.
par.niching.F=0;  % [0 - 1]: F-Niching: Typically ~0.25 is about right.
%
% ====================================
% Critical Parameter Detection
% par.CPD.PDeactivateGenes=0; % [0 - 1]: Probability of gene deactivation.
% par.CPD.PReactivateGenes=0; % [0 - 1]: Probability of gene reactivation.
% Graphics/interface
par.interface.myPlot='myPlot'; % [string]: Name of custom plot function.
% ====================================
% Immigration
par.immigration.PImmigrate=0.05; % [0 - 1, usually << 1]: Probability of immigration between populations.
%
% ====================================
% Elitism
par.elitism.frac=0.05; % [0 - 1]: Fraction of population that are designated elite.
