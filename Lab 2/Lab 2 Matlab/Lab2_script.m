clc; clear; clf;
% Create a general path string that can use used to access file paths
path_name = 'C:\Users\Shane Reynolds\Google Drive\University\Charles Darwin University\Control Systems\Lab 2\Data - New\';

% Create a general tag to build .txt file list
gen_path = '*.csv';

% Store file list in files
files = dir(strcat(path_name,gen_path));

new_path = strcat(path_name,files(1).name);
data = csvread(new_path);
t = data(:,1);
Sig_in = data(:,2);
Sig_out = data(:,3);

x = linspace(0,20);
y = 1.16*ones(1,100);

figure(1)
plot(t,Sig_in)
hold on
plot(t,Sig_out)
plot(x,y,'m')
axis([0 2.5 -0.4 1.2])
xlabel('Time (s)')
ylabel('Voltage (V)')
legend('Input','Output','16% Overshoot')



new_path = strcat(path_name,files(2).name);
data = csvread(new_path);
t = data(:,1);
Sig_in = data(:,2);
Sig_out = data(:,3);

figure(2)
plot(t,Sig_in)
hold on
plot(t,Sig_out)
axis([0 2.5 -0.4 1.2])
xlabel('Time (s)')
ylabel('Voltage (V)')
legend('Input','Output')