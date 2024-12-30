function MSE = MSE_MA_filter(noise_free_signal, noisy_signal, N)
    
    % Inputs:
    % noise_free_signal: The original clean signal
    % noisy_signal: The noisy signal
    % N: Window size for the MA(N) filter
    
    % Output:
    % MSE: Mean-Squared Error between noise-free and filtered signal

    % Define the MA(N) filter coefficients
    b = (1/N)*ones(1, N);  
    a = 1;                 

    % Apply the filter to the noisy signal
    filtered_signal = filter(b, a, noisy_signal);

    % Compensate for group delay
    filtered_signal = circshift(filtered_signal, -ceil((N-1)/2));  % Uncomment for delay compensation
    
    % Compute Mean-Squared Error (MSE)
    MSE = mean((noise_free_signal - filtered_signal).^2);

end
