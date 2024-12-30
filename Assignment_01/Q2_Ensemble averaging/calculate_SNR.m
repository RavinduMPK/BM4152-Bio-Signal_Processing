function SNR = calculate_SNR(reference_signal, noisy_signal)

    % Inputs:
    %   reference_signal    - a signal witout noise (template)
    %   noisy_signal        - the signal with noise

    % Outputs:
    %   SNR                 - The signal-to-Noise Ration (in dB)

    
    % noise of the signal
    noise = noisy_signal - reference_signal;

    % signal power
    signal_power = sum(reference_signal.^2);

    % noise power
    noise_power = sum(noise.^2);

    % Calculate SNR

    SNR = 10 * log10(signal_power / noise_power);
end