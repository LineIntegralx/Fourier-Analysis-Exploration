function [xhat, ck] = ffs(xt, t, n, T)
   %initialize xhat to an array filled with t zeros
    xhat = zeros(1,length(t));

    %initialize xhat to an array filled with 2*(n+1) zeros
    ck = zeros(1, 2*n+1); 
                        
    %we do this to fill the array with the results calculated later

    %since the computation of xhat required a summation, this can be translated into a for loop in code                      
    for k = -n:n   
        %we start by calculating ck which will be needed in xhat
        ck(k+n+1) = (1/T)*trapz(t, xt.*exp(-2*1j*pi*k*t/T));
        
        %then we calculate xhat using the formula provided on moodle
        xhat = xhat + ck(k+n+1) * exp(2*1j*pi*k*t/T);
    end
end



