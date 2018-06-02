function [mag,phs] = fftcoef(data)
    
    % Fourier transform the input and output signal
    dataInFft = fft(data(:,2));
    dataOutFft = fft(data(:,3));
    
    % Find the maximum amplitude value of the input frequency
    [~,I] = max(abs(dataInFft));
    
    % Tranfer function
    H_fft = dataOutFft./dataInFft;
    
    mag = abs(H_fft(I));
    phs = angle(H_fft(I))*(180/pi);
    
    if phs > 0
        phs = phs - 360;
    end
    
end    