function [mag,phs,f] = fftcoef(data)
    
    % Fourier transform the input and output signal
    dataInFft = fft(data(:,2));
    dataOutFft = fft(data(:,3));
    
    % Frequency
    Fs = 100;
    L = length(data(:,2));
    freq = Fs*(0:(L/2))/L;
    
    % Find the maximum amplitude value of the input frequency
    [~,I] = max(abs(dataInFft(2:end)));
    
    % Tranfer function
    H_fft = dataOutFft./dataInFft;
    
    f = freq(I)*(2*pi);
    mag = abs(H_fft(I));
    phs = angle(H_fft(I))*(180/pi);
    
    if phs > 0
        phs = phs - 360;
    end
    
end    