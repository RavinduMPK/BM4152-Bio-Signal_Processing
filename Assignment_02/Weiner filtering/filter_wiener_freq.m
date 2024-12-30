function Y_hat = filter_wiener_freq(x, W_f, points)
    % filter_wiener_freq: this function is for filter the signal in
    % frequency domain and output the time domain signal
    %
    % Inputs:
    %   x       - Noisy signal
    %   W_f     - Wiener weights
    %   points  - Signal length
    %
    % Outputs:
    %   Y_hat - Filtered signal in time domain

    length = 2 * points - 1;

    % Apply the wiener filter
    Sxx = fft(x, length);

    Syy_hat = W_f .* Sxx;


    % Take the time domain signal
    Y_hat = ifft(Syy_hat);
    Y_hat = Y_hat(1:points);
end