% Clear variables in the workspace, clear the screen and clear the
% present figures
clear; clc; clf;

% Specify the variables for the transfer function
k_dc = 1.995;
Tc = 3.18e-4;

% Create a symbolic representation of the transfer function G(s)
s = tf('s');
G = k_dc/(Tc*s + 1);

% Create a Bode plot of the transfer function and plot the phase
% point that was given as a check for accuracy
hold on
bode(G)
plot(2*pi*250,-26.6,'ro')
