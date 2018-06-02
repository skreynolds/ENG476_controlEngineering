function systidf(freq,H_mag,phlag)
    
    fprintf('\n\n\nEstimating Transfer Function...\n');

    % Complex frequency response data of the system
    zfr = H_mag.*exp(1i*phlag*pi/180);
    
    % Time sampling intervals 
    Ts = 0.01;
    
    % Create idfrd object to pass to t/fer function discovery
    gfr = idfrd(zfr,freq,Ts);
    
    % Bode plot of idfrd object
    figure(3)
    bode(gfr);
    
    % System identification using a first order model
    tfest(gfr,2,0)
end