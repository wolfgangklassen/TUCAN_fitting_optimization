%
% Qubist 5: A Global Optimization, Modeling & Visualization Toolbox for MATLAB
%
% Ferret: A Multi-Objective Linkage-Learning Evolutionary optimizer
% Locust: A Multi-Objective Particle Swarm Optimizer
% Anvil: A Multi-Objective Simulated Annealing/Genetic Algorithm Hybrid
% SAMOSA: Simple Approach to a Multi-Objective Simplex Algorithm
%
% Copyright 2002-2018. nQube Data Science Inc. All rights reserved.
% Author: Jason D. Fiege, Ph.D.
% design.innovate.optimize @ www.nQube.com
% ============================================================================

function txt=getSystemParameters

txt=[computer, '|', version, '|', license];
mac=getMAC;
for i=1:length(getMAC)
    txt=[txt, '|', mac{i}];
end

% ===============================================================

function mac=getMAC
% Get the MAC addresses of the ethernet adaptors to identify the computer.

if ispc
    % Windows
    [s,ip]=system('ipconfig /all');
else
    % Linux or Mac
    [s,ip]=system('ifconfig');
    if s ~= 0
        % Command not found: try the usual global path
        [s,ip]=system('/sbin/ifconfig');
    end
end

if s ~= 0
    % Command not found
    mac={'00:00:00:00:00:00'};
    return
end

% The command worked.  Extract the MAC address.
macRegExp='\<\w\w[:-]\w\w[:-]\w\w[:-]\w\w[:-]\w\w[:-]\w\w\>';
len=17;
pos=regexp(ip,macRegExp);
%
for i=length(pos):-1:1
    mac{i}=ip(pos(i):pos(i)+len-1);
end
