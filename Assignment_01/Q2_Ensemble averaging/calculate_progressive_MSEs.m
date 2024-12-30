function MSEk = calculate_progressive_MSEs(template, epochs, M)
    
    % Inputs:
    %   template    - Reference signal
    %   epoch       - Matrix that contains windowed stimulus points
    %   M           - Maxium number of epochs


    % Output:
    %   MSEk        - MSE values calculated prograssively upto M

    MSEk = [];

    for i = 1 : M

        % Mean of first i epochs
        y_i = mean(epochs(:, (1:i)), 2);

        % MSE calculating
        MSE_value = sqrt(mean((template - y_i).^2));

        MSEk(i,1) = MSE_value;

    end
end
