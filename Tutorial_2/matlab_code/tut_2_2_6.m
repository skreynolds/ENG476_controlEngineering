% Clear variables and the workspace
clear; clc;

% Set model parameters
T = 1;
K = 1.427;

% Define the numberator and denominator for the transfer function
numerator = [K*T K];
denominator = [1 K K];

% Build transfer function
sys = tf(numerator,denominator);

% Step response to closed loop controlled system
[phi,time] = step(sys);
step_plot = ones(length(phi),1);
error_plot = phi - step_plot;
Mo = ((max(phi) - 1)/1)*100;

% Print the maxover shoot in time domain
fprintf('Max overshoot: %.2f\n',Mo);

% Plot step response
figure(1)
subplot(2,1,1)
plot(time, phi,time,step_plot)
ylabel('phi(t)')
axis([0,9.5,0,1.5])
legend('Output [phi(t)]','Reference [r(t)]')

subplot(2,1,2)
plot(time, error_plot,'g')
xlabel('time')
ylabel('error')
axis([0,9.5,-1,0.5])

% Plot bode plot
figure(2)
bode(sys)