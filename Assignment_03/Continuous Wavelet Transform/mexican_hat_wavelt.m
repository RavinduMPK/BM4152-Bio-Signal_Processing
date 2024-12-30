function wavelt = mexican_hat_wavelt(t, s, tau)
    % mexican_hat_wavelt: Generates the Mexican hat wavelet for given parameters.
    %
    % INPUTS:
    %   t   - A vector of time points at which the wavelet is evaluated.
    %   s   - The scaling factor (determines the width of the wavelet).
    %   tau - The translation factor (shifts the wavelet in time).
    %
    % OUTPUT:
    %   wavelt - A vector containing the computed Mexican hat wavelet values 
    %            for each time point in 't'.
    

    % Compute the Mexican hat wavelet
    wavelt = (2 / sqrt(3 * sqrt(pi))) * (1 / sqrt(s)) .* ...
             (((t - tau) / s).^2 - 1) .* exp(-0.5 * ((t - tau) / s).^2);
end
