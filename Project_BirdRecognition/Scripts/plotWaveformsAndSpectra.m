function plotWaveformsAndSpectra(audioFiles)
    for i = 1:length(audioFiles)
        [signal, Fs] = audioread(audioFiles{i});
        
        % computing time vector
        t = (0:length(signal)-1) / Fs; % time in seconds
        
        % computing frequency spectrum
        N = length(signal);
        spectrum = abs(fft(signal)); % magnitude of fft
        spectrum = spectrum(1:floor(N/2)); % take positive frequencies only
        freq = (0:floor(N/2)-1) * Fs / N; % frequency axis
        
        % plotting the waveform
        figure('Name', ['Waveform and Spectrum for ', audioFiles{i}]);
        subplot(2, 1, 1);
        plot(t, signal);
        title(['Waveform of ', audioFiles{i}]);
        xlabel('Time (s)');
        ylabel('Amplitude');
        
        % plotting frequency spectrum
        subplot(2, 1, 2);
        plot(freq, spectrum / max(spectrum)); % normalizing spectrum for better visualization
        title(['Frequency Spectrum of ', audioFiles{i}]);
        xlabel('Frequency (Hz)');
        ylabel('Normalized Magnitude');
    end
end
