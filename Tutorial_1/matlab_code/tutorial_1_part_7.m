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

% The fft implementation using the number of fft points as 4096
nfft = 4096;

fft_uleft_sample = fft(sample_uleft,nfft);
fft_uleft_sample = fft_uleft_sample(1:nfft/2);

fft_uright_sample = fft(sample_uright,nfft);
fft_uright_sample = fft_uright_sample(1:nfft/2);

fft_yleft_sample = fft(sample_yleft,nfft);
fft_yleft_sample = fft_yleft_sample(1:nfft/2);

fft_yright_sample = fft(sample_yright,nfft);
fft_yright_sample = fft_yright_sample(1:nfft/2);

fft_w = (2*pi)*(0:nfft/2-1)*fs/nfft;

% Code plots the samples and the filtered samples from the left 
% and right channels for the time slice 1.0s to 1.1s
subplot(2,1,1)
loglog(fft_w,abs(fft_uleft_sample))
axis([10^2 10^5 10^-2 10^2]);
title('Left Channnel')
xlabel('frequency (rad/sec)')
ylabel('magnitude')
hold on
loglog(fft_w,abs(fft_yleft_sample))
legend('unfiltered','filtered')

subplot(2,1,2)
loglog(fft_w,abs(fft_uright_sample))
axis([10^2 10^5 10^-2 10^2]);
title('Right Channnel')
xlabel('frequency (rad/sec)')
ylabel('magnitude')
hold on
loglog(fft_w,abs(fft_yright_sample))
legend('unfiltered','filtered')

