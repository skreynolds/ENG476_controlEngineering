clc; clear; clf;
% Create a general path string that can use used to access file paths
path_name = 'C:\Users\Shane Reynolds\Google Drive\University\Charles Darwin University\Control Systems\Lab 4\Lab 4 Data\';

% Create a general tag to build .txt file list
gen_path = '*.csv';

% Store file list in files
files = dir(strcat(path_name,gen_path));

% Pull file path and load data from file into system store in data
new_path = strcat(path_name,files(1).name);
data = csvread(new_path);
    
t = data(:,1);
sig_in = data(:,2);
sig_out = data(:,3);

plot(t,sig_in)
hold on
plot(t,sig_out)