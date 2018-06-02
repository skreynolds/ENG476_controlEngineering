%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script takes a series of files, extracts data, plots input and output
% signals for the system and runs linear regression to determine amplitudes
% and cross correlation to determine phase lag. Further, script creates
% Bode plot for data and then estimates Transfer function for system.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear;
% Create a general path string that can use used to access file paths
path_name = 'C:\Users\Shane Reynolds\Google Drive\University\Charles Darwin University\Control Systems\Lab 1\Data - New\';

% Create a general tag to build .txt file list
gen_path = '*.csv';

% Store file list in files
files = dir(strcat(path_name,gen_path));

% Frequencies used in experiment
frequency = [7.5 10 120 15 150 20 200 25 30 40 ...
                50 70 90 2 1 1.5 2.5 3 4 5];
L = length(frequency);

% Create storage vectors for signal parameters
Au = zeros(1,L); ubar = zeros(1,L); Ay = zeros(1,L);
ybar = zeros(1,L); phlag = zeros(1,L);

% Loop creates a subplot which plots input and response. Also determines
% signal amplitude, DC signal and phase lag for each file
for i = 1:length(frequency)
    % Pull file path and load data from file into system store in data
    new_path = strcat(path_name,files(i).name);
    data = csvread(new_path);
    % t is the time for which the process was run, u is the input data,
    % and y is the output data
    t = data(:,1); u = data(:,2); y = data(:,3);
    % Determine the subplot entry to plot in
    figure(1)
    subplot(5,4,i);
    % Plot the input signal, title the graph and label the axes
    sigplot(t,u,y,frequency(i))
    % Obtain DC bias, signal amplitude and phase lag
    [Au(i), ubar(i), Ay(i), ybar(i), phlag(i)] = coeffgrab(t,u,y,frequency(i));
end

% Transfer function magnitude vector
H_mag = abs(Ay)./abs(Au);

% Display model parameters
parameter_printout(frequency,ubar,Au,Ay,H_mag,phlag);

% Create Bode plot
figure(2);
plot_bode(frequency, H_mag, phlag)

% System identification of 1st order transfer function
systidf(frequency,H_mag,phlag)

