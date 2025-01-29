function xrcon = reconstruct(t, x_sample, fs)
    % Initialize the xrcon function to zeros
    xrcon = zeros(size(t));
    Ts = 1 / fs;

    % Determine the index of the central sample
    i = floor((numel(x_sample)) / 2);

    % Reconstruct the signal using the given formula
    for j = 1:length(t)
        for k = -i:i
            index = k + i + 1;
            v = sinc((t(j) / Ts) - k);
            xrcon(j) = xrcon(j) + (x_sample(index) * v);
        end
    end
end