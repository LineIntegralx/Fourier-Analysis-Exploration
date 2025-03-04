function main1()
    
    t = linspace(-1, 1, 1000); % Updated time vector from -10 to 10
    % Define the signal xt with the given function
    %multiply by (abs(t)<1)  as a masking technique
    xt = (1 - abs(t)) .* (abs(t) < 1);

    % We initialized an array that contains many values for us to loop over later
    ns = [0,0.5,1,2,4,6,8,10,11,12,13,14,16,25,450]; 

   %Set T to 2
    T = 2;

    

    %%%%%%%%%%%%%%%%%%%%% Plotting x(t) and xhat %%%%%%%%%%%%%%%%%%%%%

    figure;
    plot(t, xt, 'b-', 'LineWidth', 2); % Original signal
    hold on;

    % Apply ffs on each one of the ns to get xhat of the chosen n and plot it
    for k = 1:length(ns)
        n = ns(k);
        [xhat, ~] = ffs(xt, t, n, T);
        plot(t, xhat, '-', 'LineWidth', 1.5); % Approximated signal xhat
    end

    hold off;

    % We add the legend and labels for the plot
    legend_str = ['x(t)'; cellstr(num2str(ns', 'n=%d'))];
    legend(legend_str);
    xlabel('Time');
    ylabel('Amplitude');
    title('Fourier Series Approximation');

    % We initialized an array that contains many values of T for us to loop over later
    Ts = [1, 1.5, 2, 3, 4]; 
    square_err = zeros(length(ns), length(Ts)); % Create an array to store the errors
    for k = 1:length(ns)
        n = ns(k);
        for i = 1:length(Ts)
            T = Ts(i);
            [xhat, ~] = ffs(xt, t, n, T);
            % Calculate the squared error
            square_err(k, i) = trapz(t, abs(xt - xhat).^2);
        end
    end
%%%%%%%%%%%%%%%%%%%%% Plotting the Squared Error %%%%%%%%%%%%%%%%%%%%%

figure;
    for i = 1:length(Ts)
        T = Ts(i);
        plot(ns, square_err(:, i), 'o-', 'LineWidth', 1.5);
        hold on;
    end

    hold off;

    % Add legend and labels
    legend(cellstr(num2str(Ts', 'T=%d')));
    xlabel('n');
    ylabel('Squared Error');
    title('Squared Error for Different T');

    %%%%%%%%%%%%%%%%%%%%%%% Testing for rect%%%%%%%%%%%%%%%%%%%%%%% 
    % Define the time vector and time-domain signal
    t = linspace(-2, 2, 1000);
    xt = rectpuls(t);
    
    % Set the period
    T = 4;
    
    
    % Call the ftr function
    [F,xf,W] = ftr(xt, t, T);
    % Plot the time-domain signal
    figure;
    subplot(2, 1, 1);
    plot(t, xt, 'b', 'LineWidth', 1.5);
    xlabel('Time');
    ylabel('Amplitude');
    title('Original Function');
    grid on;
    
    % Plot the frequency-domain signal
    subplot(2, 1, 2);
    plot(F, xf, 'b', 'LineWidth', 1.5); %y 1.5? maybe this is error bs beddesh aaml run aw shi ahsan ma ekhrob el deni
    xlabel('Frequency');
    ylabel('Magnitude');
    title('Fourrier Transform');
    grid on;

    % Define the frequency vector and frequency-domain signal
    f = linspace(-2, 2, 1000);
    xf = rectpuls(f);
    
    % Set the width parameter
    W = 1;
    
    % Call the iftr function
    [t, xt, T] = iftr(f, xf, W);
    
    
    
    figure;
    subplot(2, 1, 1);
    plot(f, xf, 'b', 'LineWidth', 1.5);
    xlabel('Frequency');
    ylabel('Magnitude');
    title('Original Function');
    grid on;
    
    subplot(2, 1, 2);
    plot(t, xt, 'b', 'LineWidth', 1.5);
    xlabel('Time');
    ylabel('Amplitude');
    title('Inverse Fourier Transform');
    grid on;



end