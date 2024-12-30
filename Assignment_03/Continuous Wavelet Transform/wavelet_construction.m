clearvars; close all; clc;

fs = 250;           % Sample frequency
N = 3000;           % Data length
t = (-N:N)/fs;      % Time scale
s_values = 0.01:0.1:2;     % Values of scaling factor
tau = 0;

% Initialize array to store results
psi = zeros(length(s_values), length(t));

means = zeros(1, length(s_values));
energies = zeros(1, length(s_values));
compact_supports = zeros(1, length(s_values));
compact_support_percent = zeros(1, length(s_values)); 

% Maxican hat wavelet
for i = 1:length(s_values)
    s = s_values(i);
    psi(i, :) = mexican_hat_wavelt(t, s, 0);


    % Calculate mean and energy of the wavelet
    wavelt = psi(i, :);
    means(i) = abs(mean(wavelt));
    energies(i) = trapz(t, wavelt.^2);


    % Compute cumulative energy
    cumulative_energy = cumtrapz(t, wavelt.^2);  % Cumulative energy over time
    normalized_energy = cumulative_energy / energies(i);  % Normalize to [0, 1]

    % Find the compact support (99% energy)
    total_time_span = t(end) - t(1);
    idx_start = find(normalized_energy >= 0.005, 1);  % 0.5% from start
    idx_end = find(normalized_energy >= 0.99, 1);     % 99% of energy
    compact_supports(i) = (t(idx_end) - t(idx_start));  % Time interval for 99% energy

    % Calculate compact support as a percentage of the total time span
    compact_support_percent(i) = ((total_time_span - compact_supports(i)) / total_time_span) * 100;

    % Print mean, energy, compact support, and percentage
    fprintf('Wavelet s = %.2f: Mean = %.4f, Energy = %.4f, Compact Support = %.4f s (%.2f%%)\n', ...
            s, means(i), energies(i), compact_supports(i), compact_support_percent(i));

    % % Create a new figure for each wavelet
    % figure; 
    % plot(t, psi(i, :), 'DisplayName', ['s = ' num2str(s_values(i))]);
    % xlabel('t (s)');
    % ylabel('\psi_{s, \tau}(t)');
    % title(['\psi_{s, \tau}(t) for s = ' num2str(s_values(i))]);
    % legend show;
    % grid on;
    
    % % Plot the frequency spectrum of the wavelet
    % wavelt = psi(i, :);
    % Fwavelt = fft(wavelt) / length(wavelt);
    % hz = linspace(0, fs / 2, floor(length(wavelt) / 2) + 1);
    % 
    % figure; % Create a new figure for each FFT plot
    % plot(hz, 2 * abs(Fwavelt(1:length(hz))));
    % xlabel('Frequency (Hz)');
    % ylabel('Amplitude');
    % title(['Frequency Spectrum of Wavelet for s = ' num2str(s)]);
    % grid on;
    % 
    % % Create a spectrogram for the wavelet
    % figure;
    % spectrogram(wavelt, 128, 120, 128, fs, 'yaxis'); % Using built-in spectrogram function
    % colormap jet;
    % title(['Spectrogram of Wavelet for s = ' num2str(s)]);
end

% Create a single figure containing all the wavelets
figure;
hold on;
for i = 1:length(s_values)
    plot(t, psi(i, :), 'DisplayName', ['s = ' num2str(s_values(i))]);
end
hold off;
xlabel('t (s)');
ylabel('\psi_{s, \tau}(t)');
title('All Wavelets for Different s Values');

% Single figure with all frequency spectra overlaid
figure;
hold on;
for i = 1:length(s_values)
    wavelt = psi(i, :);
    Fwavelt = fft(wavelt) / length(wavelt);
    hz = linspace(0, fs / 2, floor(length(wavelt) / 2) + 1);
    plot(hz, 2 * abs(Fwavelt(1:length(hz))), 'DisplayName', ['s = ' num2str(s_values(i))]);

end
hold off;
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Wavelet Frequency Spectra for Different s Values');
legend show;
grid on;
legend show;
grid on;

