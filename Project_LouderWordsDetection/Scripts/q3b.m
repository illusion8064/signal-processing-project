files = {'1.wav', '2.wav', '3.wav', '4.wav', '5.wav', '6.wav', '7.mp3', '8.mp3', '9.mp3'};

% initializing audio files as an array
audio_files = cell(length(files), 1);

for i = 1:length(files)
    [audio, fs] = audioread(files{i});
    audio_files{i} = struct('audio', audio, 'fs', fs);
end

% processing each audio file
for i = 1:length(audio_files)
    % loading each audio and its sampling frequency
    audio = audio_files{i}.audio;
    fs = audio_files{i}.fs;

    % normalizing the audio signal
    audio = audio / max(abs(audio));
    
    % applying a filter to remove high frequency 
    N = length(audio);
    fft_audio = fft(audio);
    freq = (0:N-1) * (fs / N);
    fft_audio(freq > 1000) = 0;
    filtered_audio = ifft(fft_audio, 'symmetric');
    filtered_audio = filtered_audio / max(abs(filtered_audio)); % normalizing filtered audio
    
    % computing energy in overlapping windows
    window_len = 250;
    step_size = 125;
    num_windows = floor((length(filtered_audio) - window_len) / step_size) + 1;   
    energy = zeros(num_windows, 1);
    window_times = zeros(num_windows, 1);
    
    for j = 1:num_windows
        start_idx = (j-1) * step_size + 1;
        end_idx = start_idx + window_len - 1;
        window = filtered_audio(start_idx:end_idx);
        energy(j) = sum(window.^2);
        window_times(j) = (start_idx + end_idx) / 2 / fs; % midpoint of the window
    end
    
    % calculating dynamic threshold for the audios 
    energy = energy / max(energy); % normalizing energy to range [0, 1]
    smooth_energy = movmean(energy, 10); % smoothing the energy using moving avg
    avg_energy = mean(smooth_energy);
    energy_threshold = 8.8 * avg_energy; % we adjusted the threshold using hit and trial to obtain desired peaks 
    
    % detecting peaks in energy
    [peaks, locations] = findpeaks(energy, 'MinPeakHeight', energy_threshold);
    
    % assigning time vector for the audio signal
    t = (0:length(audio)-1) / fs; 
    figure;
    
    % original audios with highlighted peaks
    subplot(2, 1, 1);
    plot(t, audio);
    hold on;
    plot(window_times(locations), peaks, 'ro');
    title(sprintf('Original Audio Signal - File %d', i));
    xlabel('Time (s)');
    ylabel('Amplitude');
    hold off;
   
    
    % Plot energy over time with peaks
    subplot(2, 1, 2);
    plot(window_times, energy, 'b');
    hold on;
    yline(energy_threshold, 'r--', 'LineWidth', 1.5);
    plot(window_times(locations), peaks, 'ro');
    title('Energy Over Time with Peaks');
    xlabel('Time (s)');
    ylabel('Energy');
    hold off;
end