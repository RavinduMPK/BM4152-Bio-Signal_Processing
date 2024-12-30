function W = wiener_opt_weights(y_i, x, M)
    % wiener_opt_weights: calculate optimum Wiener weights when given
    % expected signal and the noise with filter order
    %
    % Inputs:
    %   y_i - Expected signal
    %   x   - Noise signal
    %   M   - Wiener filter Order
    %
    % Outputs:
    %   W   - Optimum Wiener weights


    % x and y_i should be in same 
    factor = floor(length(y_i)/length(x));

    rem = mod(length(y_i), length(x));

    x_ = repmat(x, 1, factor);

    x_new = [x_ , x(1:rem)];

    % E[y_i] and E[x] should be zero
    y_i = y_i - mean(y_i);

    x_new = x_new - mean(x_new);

    % auto-correlation of the expected signal
    YY = xcorr(y_i, M-1, 'biased');
    YY_mat = toeplitz(YY(M:end));

    % auto-correlation of the noise signal
    NN = xcorr(x_new, M-1, 'biased');
    NN_mat = toeplitz(NN(M:end));

    % cross-correlation
    Yy = YY(M:end);

    % Wiener weights
    W = inv(YY_mat + NN_mat) * Yy.';

end
