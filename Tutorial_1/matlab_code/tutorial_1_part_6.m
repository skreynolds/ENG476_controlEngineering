% Clear all variables in the workspace and clear the screen
clear; clc; clf;

% Creat the file path to pass to wavread
file_name_1 = 'C:\Users\Shane Reynolds\Google Drive\University\';
file_name_2 = 'Charles Darwin University\Control Systems\Tutorial_1\';
file_name_3 = 'monkey2.wav';

file_name = strcat(file_name_1,file_name_2,file_name_3);

% Load the .wav file into u, with fs as teh sampling frequency and
% bits as the number of bits for the sample
[u,fs,bits]=wavread(file_name);

% Split the channels from the original file into right and left
% signals
uleft = u(:,1);
uright = u(:,2);

% To obtain a uniform time vector for the sample the sampling period
% was found and linspace used to create a time vector
Ts = 1/fs;
total_time = length(u)*Ts;
time = linspace(0,total_time,length(u))';

% We wanted a slice of the sound file from 1.0s to 1.1s for analysis
% the code here represents the start and finish indexes for this time
% period
start_ind = 1/Ts;
finish_ind = 1.1/Ts;

% Pass both signals through the transfer function
sys = tf(1.995, [3.18e-4 1]);
yleft = lsim(sys,uleft,time);
yright = lsim(sys,uright,time);

% Using the time indexes from above, samples from 1.0s to 1.1s for the
% left and right channels were obtained
sample_time_interval = time(start_ind:finish_ind,1);
sample_uleft = uleft(start_ind:finish_ind,1);
sample_uright = uright(start_ind:finish_ind,1);

% Using the time indexes from above, samples from 1.0s to 1.1s for the
% left and right filtered channels were obtained
sample_yleft = yleft(start_ind:finish_ind,1);
sample_yright = yright(start_ind:finish_ind,1);

% Code plots the samples and the filtered samples from the left 
% and right channels for the time slice 1.0s to 1.1s
subplot(2,2,1)
plot(sample_time_interval,sample_uleft)
axis([1 1.1 -0.25 0.25]);
title('Left Channnel')
xlabel('time')
ylabel('magnitude')

subplot(2,2,2)
plot(sample_time_interval,sample_uright)
axis([1 1.1 -0.25 0.25]);
title('Right Channnel')
xlabel('time')
ylabel('magnitude')

subplot(2,2,3)
plot(sample_time_interval,sample_yleft)
axis([1 1.1 -0.25 0.25]);
title('Filtered Left Channnel')
xlabel('time')
ylabel('magnitude')

subplot(2,2,4)
plot(sample_time_interval,sample_yright)
axis([1 1.1 -0.25 0.25]);
title('Filtered Right Channnel')
xlabel('time')
ylabel('magnitude')