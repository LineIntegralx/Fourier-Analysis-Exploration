function main_samp_rec()

   % Define the original signal parameters
    f0 = 1; % Frequency of the signal
    t = linspace(-8 ,8,1000); % Time vector
    xt = cos(2*pi*f0*t); % Original signal
    
    % Define the sampling rates
    fs1 = 0.5*f0;
    fs2 = 2*f0;
    fs=4*f0;

    % Sample the signal at different rates
    [t_sample1, x_sample1] = sample(t, xt, fs1);
    [t_sample2, x_sample2] = sample(t, xt, fs2);
    [t_sample, x_sample] = sample(t, xt, fs);

    xrcon1= reconstruct(t,x_sample1,fs1);
    xrcon2= reconstruct(t,x_sample2,fs2);
    xrcon= reconstruct(t,x_sample,fs);

   % Plot the original and sampled signals
    figure;
    subplot(3,1,2);
    plot(t, xt, 'b', t_sample2, x_sample2, 'g.');
    xlabel('Time');
    ylabel('x(t)');
    legend('Original Signal', 'Sampled at fs2 = 2f_0');
    
    subplot(3,1,1);
    plot(t, xt, 'b', t_sample1, x_sample1, 'r.');
    xlabel('Time');
    ylabel('x(t)');
    legend('Original Signal', 'Sampled at fs1 = 0.5f_0');

    subplot(3,1,3);
    plot(t, xt, 'b', t_sample, x_sample,'m.');
    xlabel('Time');
    ylabel('x(t)');
    legend('Original Signal', 'Sampled at fs = 4f_0');
    
    % Plot the reconstructed signa
    figure;
    subplot(3,1,1);
    plot(t, xrcon1, 'r');
    xlabel('Time');
    ylabel('xrcon1');
    title('Reconstructed Signal (fs1)');
    
    subplot(3,1,2);
    plot(t, xrcon2, 'r');
    xlabel('Time');
    ylabel('xrcon2');
    title('Reconstructed Signal (fs2)');

    subplot(3,1,3);
    plot(t, xrcon, 'r');
    xlabel('Time');
    ylabel('xrcon');
    title('Reconstructed Signal (fs)');

    figure;
    subplot(2,1,1);
    plot(t, xt, 'b', t_sample, x_sample,'m.');
    xlabel('Time');
    ylabel('x(t)');
    legend('Original Signal', 'Sampled at fs = 4f_0');

    subplot(2,1,2);
    plot( t_sample, x_sample,'m');
    xlabel('Time');
    ylabel('x(t)');
    legend('Example');    
end
