function mu_max = LMS_rate_of_conv(reference, order)

    % LMS_rate_of_conv: calculate rate of convergence for given signal and
    % filter order
    %
    %
    % Inputs:
    %   reference   - reference signal (reference for noise)
    %   order       - the filter order
    %
    % Outputs:
    %   mu_max      - the maximum value for mu
    
    N = length(reference);

    % Calculate mu

    Px = (1/N) * sum(reference.^2);     % Power of the reference noise
    lambda = 20 * order * Px;           % lambda = 20*order*reference
    mu_max = 2 / lambda;
end