referenceFiles = {'bird1.wav', 'bird2.wav', 'bird3.wav'};

taskFiles = {'F1.wav', 'F2.wav', 'F3.wav', 'F4.wav', 'F5.wav', 'F6.wav', 'F7.wav','F8.wav'};

% call the functions
classifyTaskFiles(referenceFiles, taskFiles);
plotWaveformsAndSpectra(referenceFiles);
plotWaveformsAndSpectra(taskFiles);
