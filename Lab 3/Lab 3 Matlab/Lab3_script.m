clc; clear; clf;
% Create a general path string that can use used to access file paths
path_name = 'C:\Users\Shane Reynolds\Google Drive\University\Charles Darwin University\Control Systems\Lab 3\Lab 3 Data\';

% Create a general tag to build .txt file list
gen_path = '*.csv';

% Store file list in files
files = dir(strcat(path_name,gen_path));
val = [-1,-2,-3,1,2,3];

for i = 1:length(files)
% Pull file path and load data from file into system store in data
    new_path = strcat(path_name,files(i).name);
    data = csvread(new_path);
    
    position = data(:,3);
    tacho = data(:,4);
    
    G = tacho./position;
    t = 0:0.1:0.1*(length(G)-1);
    
    
    subplot(3,2,i)
    plot(t,position)
    hold on
    plot(t,tacho)
    axis([10 20 -10 10])
    name = [num2str(val(i)),'V Input'];
    title(name)
    xlabel('Time (s)');
    ylabel('Magnitude (V)')
    legend('Position','Tachometer')
end