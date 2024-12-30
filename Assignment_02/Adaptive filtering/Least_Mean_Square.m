function [error, e, w_i] = Least_Mean_Square(primary, reference, order, mu)

    % Least_Mean_Square: calculate Least Mean Square adaptive filter
    % weights and the give estimated (filtered) signal and estimated noise
    %
    %
    % Inputs:
    %   primary     - primary input (noisy signal)
    %   reference   - reference signal (reference for noise)
    %   order       - the filter order
    %   factor      - mu selecting parameter (0 <= factor <= 1). By
    %   changing this factor, you can obtains a value to mu in between 0
    %   and 2/lambda
    %
    % Outputs:
    %   error       - estimated error
    %   e           - estimated signal
    %   w_i         - filter weights
    %   mu          - rate of convergence
    
    N = length(primary);
    M = order + 1;


    w_i = zeros(M, 1);
    e = zeros(N, 1);
    error = zeros(N, 1);

    
    % Filtering
    for n = M : N
        r_n = reference(n: -1: n-(M-1));
        error(n) = w_i' * r_n;
        e(n) = primary(n) - error(n);
        w_i = w_i + 2 * mu * e(n) * r_n;
    end
end
