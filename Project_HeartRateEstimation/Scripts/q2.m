load('E1.mat'); 
load('E2.mat');
load('E3.mat');
% sampling rate
fs = 128; 

% defining threshold based on the maximum value of the ECG signal
threshold_value = 0.3 * max(E1);  

% detecting R-peaks
[peaks, locations] = findpeaks(E1, 'MinPeakHeight', threshold_value, 'MinPeakDistance', fs*0.4);

% finding out RR intervals in seconds
RR_intervals = diff(locations) / fs;

% estimate hear rate (beats per minute)
HR = 60 ./ RR_intervals;
time_axis = (locations(2:end) - 1) / fs;  % time axis for heart rate

% limiting time to 200 seconds for E1
% select indices where time is <= 200 seconds
valid_indices_E1 = time_axis <= 200; 
time_axis_limited = time_axis(valid_indices_E1);
HR_limited = HR(valid_indices_E1);

% plot heart rate
figure;
plot(time_axis_limited, HR_limited);
xlabel('Time (s)');
ylabel('Heart Rate (bpm)');
title('Heart Rate Estimation from Noise-Free ECG (E1)');
grid on;

% designing a bandpass filter for noise removal in signals E2 and E3
fs = 128;               % sampling frequency (Hz)
fc = 50;                % cut-off frequency (Hz) 
filter_order = 4;       % Filter order

% designing a Butterworth low-pass filter
[b, a] = butter(filter_order, fc/(fs/2), 'low'); 

% [b, a] = butter(2, [0.5 50] / (fs / 2), 'bandpass');
E2_filtered = filter(b, a, E2);
E3_filtered = filter(b, a, E3);


% Detect R-peaks for E2 and E3 after filtering
[peaks_E2, locations_E2] = findpeaks(E2_filtered, 'MinPeakHeight', threshold_value, 'MinPeakDistance', fs*0.6);
[peaks_E3, locations_E3] = findpeaks(E3_filtered, 'MinPeakHeight', threshold_value, 'MinPeakDistance', fs*0.6);

% Calculate RR intervals and HR for E2
RR_intervals_E2 = diff(locations_E2) / fs;
HR_E2 = 60 ./ RR_intervals_E2;
time_axis_E2 = (locations_E2(2:end) - 1) / fs;  % in minutes

% Calculate RR intervals and HR for E3
RR_intervals_E3 = diff(locations_E3) / fs;
HR_E3 = 60 ./ RR_intervals_E3;
time_axis_E3 = (locations_E3(2:end) - 1) / fs;  % in minutes

% Limit time to 100 seconds for E2
valid_indices_E2 = time_axis_E2 <= 200;  % Select indices where time is <= 100 seconds
time_axis_E2_limited = time_axis_E2(valid_indices_E2);
HR_E2_limited = HR_E2(valid_indices_E2);

% Plot HR for E2
figure;
plot(time_axis_E2_limited, HR_E2_limited);
xlabel('Time (minutes)');
ylabel('Heart Rate (bpm)');
title('Heart Rate Estimation from Filtered Noisy ECG (E2)');
grid on;

% Limit time to 100 seconds for E3
valid_indices_E3 = time_axis_E3 <= 200;  % Select indices where time is <= 100 seconds
time_axis_E3_limited = time_axis_E3(valid_indices_E3);
HR_E3_limited = HR_E3(valid_indices_E3);

% Plot HR for E3
figure;
plot(time_axis_E3_limited, HR_E3_limited);
xlabel('Time (minutes)');
ylabel('Heart Rate (bpm)');
title('Heart Rate Estimation from Filtered Noisy ECG (E3)');
grid on;
