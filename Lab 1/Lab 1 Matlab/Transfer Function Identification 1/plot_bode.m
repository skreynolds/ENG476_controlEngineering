function plot_bode(freq, H_mag, phlag)
    
    % Convert
    dB_H_mag = mag2db(H_mag);
    
    % Plot the magnitude function
    subplot(2,1,1);
    semilogx(freq, dB_H_mag, 'o');
    title('Bode Plot');
    ylabel('Magnitude (dB)');
    
    
    % Plot the phase function
    subplot(2,1,2);
    semilogx(freq, phlag, 'o');
    xlabel('Frequency (rad/s)');
    ylabel('Phase Lag (Deg)');
    
end