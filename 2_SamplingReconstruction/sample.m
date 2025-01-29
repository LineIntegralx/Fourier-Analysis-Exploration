function [t_sample, x_sample]=sample(t,xt,fs)
    
    Ts = 1 / fs;

    % Create the sampled time vector
    t_sample = t(1):Ts:t(end);

    %t_sample = linspace(t(1), t(end), numel(t));
    %can not use linspace because it gives full graphs so we found an
    %alternative


    % Initialize the sampled signal vector
    x_sample = zeros(size(t_sample));

    % Interpolate the original signal at the sampled time points
    for i = 1:length(t_sample)
        % Find the closest time point in the original signal
        [~, id] = min(abs(t - t_sample(i)));
        % Assign the corresponding value from the original signal to the sampled signal
        x_sample(i) = xt(id);

    end

end