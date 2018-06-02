function parameter_printout(freq,ubar,Au,Ay,H_mag,phlag)
    
    % Printout headings
    fprintf('\n\n\nEstimating parameters...\n');
    data = [ubar' Au' Ay' H_mag' phlag'];
    
    %row_name = {'ROW1','ROW2','ROW3','ROW4','ROW5','ROW6','ROW7','ROW8'};
    %col_name = {'Freq','ubar','Au','Ay','H_mag','H_Phase_lag'};
    %array2table(data, 'VariableNames', col_name, 'RowNames', row_name)
    
    row_name = 'Freq(7.5) Freq(10.0) Freq(120.0) Freq(15.0) Freq(150.0) Freq(20.0) Freq(200.0) Freq(25.0) Freq(30.0) Freq(40.0) Freq(50.0) Freq(70.0) Freq(90.0) Freq(2.0) Freq(1.0) Freq(1.50) Freq(2.5) Freq(3.0) Freq(4.0) Freq(5.0)';
    col_name = 'ubar Au Ay H_mag H_Phase_lag';
    printmat(data, 'SIGNAL PARAMETERS',row_name,col_name);
end