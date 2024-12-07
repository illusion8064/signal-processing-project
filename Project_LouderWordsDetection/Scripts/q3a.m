
%  9th
% [audio, fs] = audioread('9.mp3');
% words = {'i', 'didnt', 'say', 'he', 'stole', 'the', 'money'};
% start_times = [0.463641, 0.555976, 0.685638, 0.919423, 0.999971, 1.701326, 1.795626];
% end_times = [0.555976, 0.685638, 0.919423, 0.999971, 1.701326, 1.795626, 2.208187];

% 8th
% [audio, fs] = audioread('8.mp3');
% words = {'i', 'didnt', 'say', 'he', 'stole', 'the', 'money'};
% start_times = [0.458962, 0.615380, 0.965261, 1.218411, 1.323375, 1.578583, 1.681489];
% end_times = [0.615380, 0.965261, 1.218411, 1.323375, 1.578583, 1.681489, 2.033429];

% 7th
% [audio, fs] = audioread('7.mp3');
% words = {'i', 'didnt', 'say', 'he', 'stole', 'the', 'money'};
% start_times = [0.449975, 0.556333, 0.744504, 1.186297, 1.362197, 1.703768, 1.818307];
% end_times = [0.556333, 0.744504, 1.026761, 1.362197, 1.703768, 1.818307, 2.125108];

% 6th
% [audio, fs] = audioread('6.wav');
% words = {'i', 'told', 'you', 'this', 'would', 'happen'};
% start_times = [0.457101, 0.721523, 1.004392, 1.184773, 1.539385, 1.781259];
% end_times = [0.721523, 1.004392, 1.184773, 1.539385, 1.781259, 2.357247];

% 5th 
% [audio, fs] = audioread('5.wav');
% words = {'i', 'told', 'you', 'this', 'would', 'happen'};
% start_times = [0.513851, 0.979678, 1.366266, 1.846501, 2.105827, 2.264305];
% end_times = [0.838009, 1.366266, 1.846501, 2.105827, 2.264305, 2.895813];

% 4th
% [audio, fs] = audioread('4.wav');
% words = {'i', 'cant', 'believe', 'we', 'are', 'actually', 'going', 'to', 'paris'};
% start_times = [0.505534, 0.770483, 1.269927, 1.882050, 2.067818, 2.262723, 2.865710, 3.142840, 3.362108];
% end_times = [0.724802, 1.269927, 1.839414, 2.067818, 2.262723, 2.865710, 3.142840, 3.328609, 4.022958];

% 3rd
% [audio, fs] = audioread('3.wav');
% words = {'i', 'cant', 'believe', 'we', 'are', 'actually', 'going', 'to', 'paros'};
% start_times = [0.452592, 0.646911, 1.003572, 1.340556, 1.426647, 1.542255, 2.088316, 2.540908, 2.789341];
% end_times = [0.646911, 1.003572, 1.340556, 1.426647, 1.542255, 2.088316, 2.540908, 2.789341, 3.360000];

% 2nd
% [audio, fs] = audioread('2.wav');
% words = {'he', 'always', 'manages', 'to', 'find', 'the', 'best', 'deals'};
% start_times = [0.502840, 0.726325, 1.555081, 2.532826, 2.638360, 3.032562, 3.209488, 3.721640];
% end_times = [0.726325, 1.471274, 2.163455, 2.638360, 3.032562, 3.209488, 3.721640, 4.227584];

% 1st 
[audio, fs] = audioread('1.wav');
words = {'wow', 'i', 'won', 'it'};
start_times = [0.475139, 1.093177, 1.295022, 1.551347];
end_times = [1.093177, 1.295022, 1.551347, 1.972006];


% running a for loop to calculate loudness using rms for each word
threshold_value = 0.1191;
loud_words = {};

for i = 1:length(words)
    % sampling the indices based on start and end times by essentially
    % multiplying them by their respective sampling frequencies
    start_sample = round(start_times(i) * fs);
    end_sample = round(end_times(i) * fs);
    
    % extracting the audio segment corresponding to the word
    word_segment = audio(start_sample:end_sample);
    
    % rms of the word segment
    rms_value = sqrt(mean(word_segment.^2));
    

    % outputs
    disp(['word: ', words{i}]);
    fprintf('start time: %.6f, end time: %.6f, RMS loudness: %.4f\n\n', start_times(i), end_times(i), rms_value);

    if rms_value > threshold_value
        loud_words{end+1} = words{i};
    end
end

% printing all the loud words
disp('LOUD WORDS:');
for i = 1:length(loud_words)
    disp(loud_words{i});
end



