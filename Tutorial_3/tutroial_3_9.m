% Clear the workspace and any variables
clear; clc; clf;

for K = 1:5
    sys = tf([K K],[1 K K]);
    figure(K)
    bode(sys)
end