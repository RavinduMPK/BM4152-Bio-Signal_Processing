function MSE_SG = MSE_SG_filter(noise_free_signal, noisy_signal, N, L)
    
    %Inputs:
    % noise_free_signal: The original clean signal
    % noisy_signal: The noisy signal
    % N: Order of the polynomial
    % L: Window half length

    % Output:
    % MSE: Mean-Squared Error between noise-free and filtered signal

    L_ = 2*L + 1;

    if N <= L_ - 1
        filtered_signal = sgolayfilt(noisy_signal, N, L_);
        MSE_SG = mean((noise_free_signal - filtered_signal).^2);
    else
        MSE_SG = inf;
    end

end
