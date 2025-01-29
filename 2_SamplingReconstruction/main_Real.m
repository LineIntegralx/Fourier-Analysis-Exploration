

function main_Real()
    clc;
    clear;
    close all;
    t = linspace(-8 ,8,250); % Time vector
    data_blink = table2array(readtable('27_B.csv'));
    data_blink = data_blink(:,1);%Horizontal

    data_left = table2array(readtable('25_L.csv'));
    data_left = data_left(:,1);%Horizontal

    data_Right = table2array(readtable('19_R.csv'));
    data_Right = data_Right(:,1);%Horizontal

    fs=1.5;


%%%%%%%%%%%%%%%%%%%%%%% Blink %%%%%%%%%%%%%%%%%%%%%%%
    % Sample the signal at different rates
    [t_sample_b, x_sample_b] = sample(t, data_blink, fs);
    xrcon_blink= reconstruct(t,x_sample_b,fs);
    
    figure;
    subplot(1,2,1);
   % Plot the original and sampled signals
    plot(t, data_blink, 'b', t_sample_b, x_sample_b, 'g.');
    xlabel('Time');
    ylabel('x(t)');
    legend('Original Signal Blink', 'Sampled');
  
    subplot(1,2,2);
    % Plot the reconstructed signals
    plot(t, xrcon_blink, 'r');
    xlabel('Time');
    ylabel('xrcon_blink');
    title('Reconstructed Signal (fs)');
    
%%%%%%%%%%%%%%%%%%%%%%% left %%%%%%%%%%%%%%%%%%%%%%%
    % Sample the signal at different rates
    [t_sample_left, x_sample_left] = sample(t, data_left, fs);
    xrcon_left= reconstruct(t,x_sample_left,fs);
    
    figure;
    subplot(1,2,1);
   % Plot the original and sampled signals
    plot(t, data_left, 'b', t_sample_left, x_sample_left, 'g.');
    xlabel('Time');
    ylabel('x(t)');
    legend('Original Signal left', 'Sampled');
    subplot(1,2,2);
    % Plot the reconstructed signals
    plot(t, xrcon_left, 'r');
    xlabel('Time');
    ylabel('xrcon_left');
    title('Reconstructed Signal (fs)');

%%%%%%%%%%%%%%%%%%%%%%% Right %%%%%%%%%%%%%%%%%%%%%%%
    % Sample the signal at different rates
    [t_sample_d, x_sample_d] = sample(t, data_Right, fs);
    xrcon_d= reconstruct(t,x_sample_d,fs);
    
    figure;
    subplot(1,2,1);
   % Plot the original and sampled signals
    plot(t, data_Right, 'b', t_sample_d, x_sample_d, 'g.');
    xlabel('Time');
    ylabel('x(t)');
    legend('Original Signal Right', 'Sampled');
    subplot(1,2,2);
    % Plot the reconstructed signals
    plot(t, xrcon_d, 'r');
    xlabel('Time');
    ylabel('xrcon_Right');
    title('Reconstructed Signal (fs)');

end



