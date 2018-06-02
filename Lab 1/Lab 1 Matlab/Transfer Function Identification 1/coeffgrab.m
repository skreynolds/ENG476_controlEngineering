function [Au, ubar, Ay, ybar, phlag] = coeffgrab(t,u,y,freq)

    % Create model type to be fitted to curves
    curve = sprintf('ubar + A*sin(%1.2f*x + theta)', freq);
    type = fittype(curve);
    
    % Discover amplitude of input signal
    fitcurve_u = fit(t,u,type);
    coeff_u = coeffvalues(fitcurve_u);
    Au = coeff_u(1);
    ubar = coeff_u(3);
    
    % Discover amplitude of output signal
    fitcurve_y = fit(t,y,type);
    coeff_y = coeffvalues(fitcurve_y);
    Ay = coeff_y(1);
    ybar = coeff_y(3);
    
    % Remove DC components from signal in preparation to use cross
    % corr
    u_nodc = u - mean(u);
    y_nodc = y - mean(y);
    
    % Phase lag discovery
    [c,lag] = xcorr(u_nodc,y_nodc);
    [maxC,idx] = max(c);
    lag = lag(idx);
    phlag = 360/(2*pi)*freq*lag*0.01;
end