% Clear the workspace and any variables
clear; clc; clf;

for K = 1:5
    % Define closed loop system
    sys = tf([K K],[1 K K]);
    
    % Create new figure
    figure(K)
    
    % Plot Bode plot for system
    subplot(1,2,1)
    bode(sys)
    
    % Plot Step response for system
    subplot(1,2,2)
    step(sys)
end