function W_f = wiener_freq_weights(y_i, N, points)
    % wiener_freq_weights: calculate optimum Wiener weights in the
    % frequency domain.
    %
    % Inputs:
    %   y_i      - Expected signal
    %   N        - Noise
    %   points   - Signal length 
    %
    % Outputs:
    %   W_f - Optimum Wiener weights

    length = 2 * points - 1;

    Syy = abs(fft(y_i, length)).^ 2;

    Snn = abs(fft(N, length)).^ 2;

    % Frequency domain wienner weights calculation
    W_f = Syy ./ (Syy + Snn);

end