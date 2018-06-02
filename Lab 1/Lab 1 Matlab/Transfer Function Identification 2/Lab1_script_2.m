clc; clear; clf;
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
mag = zeros(1,L); phs = zeros(1,L);

% Loop creates a subplot which plots input and response. Also determines
% signal amplitude, DC signal and phase lag for each file
for i = 1:length(frequency)
    
    % Pull file path and load data from file into system store in data
    new_path = strcat(path_name,files(i).name);
    data = csvread(new_path);
    
    % Obtain DC bias, signal amplitude and phase lag
    [mag(i),phs(i)] = fftcoef(data);
end

subplot(2,1,1)
semilogx(frequency,mag2db(mag),'o');
title('Bode Plot');
ylabel('Magnitude (dB)');
subplot(2,1,2)
semilogx(frequency,phs,'o');
xlabel('Frequency (rad/s)');
ylabel('Phase Lag (Deg)');

systidf(frequency,mag,phs)