function classifyTaskFiles(referenceFiles, taskFiles)
    referenceSpectra = cell(1, length(referenceFiles));
    
    % processing reference files
    for i = 1:length(referenceFiles)
        [signal, ~] = audioread(referenceFiles{i});
        referenceSpectra{i} = computeSpectrum(signal); % computing frequency spectrum
    end
    
    % processing task files
    for i = 1:length(taskFiles)
        [taskSignal, ~] = audioread(taskFiles{i});
        taskSpectrum = computeSpectrum(taskSignal); % computing frequency spectrum
        
        % comparing these with reference files spectrum
        similarityScores = zeros(1, length(referenceFiles));
        for j = 1:length(referenceFiles)
            similarityScores(j) = cosineSimilarity(taskSpectrum, referenceSpectra{j});
        end
        
        % find best match
        [~, bestMatch] = max(similarityScores);
        fprintf('File %s matches with Bird %d\n', taskFiles{i}, bestMatch);
    end
end

function spectrum = computeSpectrum(signal)
    % computing the magnitude spectrum of the signal
    spectrum = abs(fft(signal));
    spectrum = spectrum(1:floor(length(spectrum)/2)); % considering positive frequencies only
    spectrum = spectrum / max(spectrum); % normalization
end

function similarity = cosineSimilarity(spectrum1, spectrum2)
    % computing cosine similarity between two spectra
    minLength = min(length(spectrum1), length(spectrum2));
    spectrum1 = spectrum1(1:minLength);
    spectrum2 = spectrum2(1:minLength);
    similarity = dot(spectrum1, spectrum2) / (norm(spectrum1) * norm(spectrum2));
end
