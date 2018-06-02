function [mag,phs,frq] = lab1fft(Sample)

fInput = fft(Sample(:,2)); %% FFT of input signal
fOutput = fft(Sample(:,3));  %% FFT of the response signal

H = fOutput./fInput;

f = 100*(0:(length(Sample(:,1))/2))/length(Sample(:,1)); %Frequency vector

Min2 = abs(fInput/length(Sample(:,1)));
Min1 = Min2(1:length(Sample(:,1))/2+1);
Min1(2:end-1) = 2*Min1(2:end-1); %Magnitude Array

Pin2 = angle(fInput/length(Sample(:,1)));
Pin1 = Pin2(1:length(Sample(:,1))/2+1);
Pin1(2:end-1) = 2*Pin1(2:end-1); %Phase Array (in radians)

Mout2 = abs(fOutput/length(Sample(:,1)));
Mout1 = fOutput(1:length(Sample(:,1))/2+1);
Mout1(2:end-1) = 2*Mout1(2:end-1); %Magnitude Array
Mout1(1) = 0;

Pout2 = angle(fInput/length(Sample(:,1)));
Pout1 = Pout2(1:length(Sample(:,1))/2+1);
Pout1(2:end-1) = 2*Pout1(2:end-1); %Phase Array (in radians)

figure(1)
plot(f,Min1)

figure(2)
plot(f,Mout1)

title('Magnitude')
xlabel('Frequency (Hz)')
ylabel('|Mag|')

[mag,ind] = max(Min1); %absolute added
phs = Pin1(ind);
frq = f(ind);

end

