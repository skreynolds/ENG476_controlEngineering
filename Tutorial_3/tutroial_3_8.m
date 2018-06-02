% Clear the workspace and variables
clear; clc; clf;

% Define the open loop system
sys = tf([1 1],[1 0 0]);

% Plot the root locus for the open loop system
rlocus(sys)
axis([-5 0 -2 2])
hold on

% Plot the pole locations for various values of the gain
K = [1 2 3 4 5];
rlocus(sys,K,'*')