function [t, xt, T] = iftr(f, xf, W)

    T = 1/(2*W);
   
    t= linspace(-(100*T),(100*T),10000);

    % Initialize the time-domain signal
    xt = zeros(size(t));
    
    % Perform the inverse Fourier transform
    for k = 1:length(f)
        % Calculate the complex exponential term
        e = exp(1i * 2*pi * f(k) * t);
        
        % Accumulate the contribution of each frequency component
        xt = xt + xf(k) * e;
    end
    
end