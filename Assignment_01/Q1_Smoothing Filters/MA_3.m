function output = MA_3(input)
    % MA_3: Apply a Moving Average (MA) filter with window size 3 to the input signal
    %
    % Inputs:
    %   input - Input signal (ECG or any other signal to be filtered)
    %
    % Outputs:
    %   output - Filtered signal using MA(3)

    % MA(3) window size is 3 and y[n] = (x[n] + x[n-1] + x[n-2])/3
    % For the first 2 samples in the signal, there are no enough samples to
    % perfoem this moving average. 
    %Since ECG is a periodic signal, I add last 2 samples of the signal to as
    %the first two value of the signal and reconstruct new signal that the
    %length is n+2 (where n is the length of the original signal)

    % Extract the last two values from the input signal
    lastTwoValues = input(end-1:end);
    
    % Concatenate last two values at the beginning of the input signal
    % to reconstruct the new signal input_1
    input_1 = [lastTwoValues, input];
    
    
    % Initialize the output array with zeros
    output = zeros(1, length(input));
    
    % Apply the moving average filter
    for n = 1:length(input)
        % Take the average of three consecutive samples
        output(n) = (input_1(n) + input_1(n+1) + input_1(n+2))/3;
    end
end
