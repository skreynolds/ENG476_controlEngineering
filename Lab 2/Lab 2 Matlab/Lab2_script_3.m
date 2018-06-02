clc; clear; clf;
% Create a general path string that can use used to access file paths
path_name = 'C:\Users\Shane Reynolds\Google Drive\University\Charles Darwin University\Control Systems\Lab 2\Data - New_2\';

% Create a general tag to build .txt file list
gen_path = '*.csv';

% Store file list in files
files = dir(strcat(path_name,gen_path));

frequency = [0.05 1 10 100 125 15 150 175 2 20 200 250 30 45 5 60 80];

% Pull data for frequency at 1Hz
new_path = strcat(path_name,files(2).name);
data = csvread(new_path);

% Obtain the output response for the step input
Sig_out = data(:,3);

% Create a transfer function object
sys = tf([595],[1 20.75 595])

% Predetermined step data which aligns to a step from 0 to 1
Sig_step = Sig_out(249:562);
t = 0:0.01:0.01*length(Sig_step);
t = t(1:end-1)';

% MATLAB step simulation
step(sys)
hold on

% Plot empirical data
plot(t,Sig_step,'or')
legend('Experimentally Determined |H(s)|','Data from step response')