function [error, e, w_i] = Recursive_Least_Squares(primary,  reference, order, lambda)

    % Recursive_Least_Square: calculate Recursive Least Square adaptive filter
    % weights and the give estimated (filtered) signal and estimated noise
    %
    %
    % Inputs:
    %   primary     - primary input (noisy signal)
    %   reference   - reference signal (reference for noise)
    %   order       - the filter order
    %   lambda      - forgetting fator (bettern if this close to 1)
    %
    % Outputs:
    %   error       - estimated error
    %   e           - estimated signal
    %   w_i         - filter weights


    N = length(primary);
    M = order + 1;

    % Initialization
    delta = 1e-2;
    P = delta^(-1) * eye(M);

    w_i = zeros(M, 1);
    e = zeros(N, 1);
    error = zeros(N, 1);


    % Filtering

    for n = M:N
        r_n = reference(n: -1: n-(M-1));
        K = (lambda ^ (-1) * P * r_n) / (1 + lambda^(-1) * r_n' * P * r_n);
        P = lambda ^ (-1) * (P - K * r_n' * P);
        e(n) = primary(n) - w_i' * r_n;
        w_i = w_i + K * e(n);
        error(n) = w_i' * r_n;
    end
end