---

# Signal Processing Projects (Monsoon 2024)

This repository contains implementations of three signal processing tasks completed as part of the Signal Processing course in Monsoon 2024. Each task involves analyzing different types of signals to extract meaningful insights.

## Projects Overview

### 1. **Bird Recognition**
- **Objective**: Identify bird species based on their sound characteristics.
- **Description**:
  - Analyze audio files of bird sounds to extract distinguishing features using time and frequency properties.
  - Use the extracted features to classify bird species for given audio files.
- **Input**:
  - Reference folder: Contains audio files of three distinct bird species.
  - Task folder: Contains audio files for classification.
- **Output**:
  - Predicted bird species for each audio file in the task folder.

---

### 2. **Heart Rate Estimation**
- **Objective**: Estimate heart rate (HR) from ECG signals, including noisy data.
- **Description**:
  - Task 1: For a noise-free ECG signal (E1), plot HR as a function of time (beats per minute).
  - Task 2: For noisy ECG signals (E2 and E3), perform noise removal and plot HR.
- **Input**:
  - ECG signals: E1 (noise-free), E2, and E3 (noisy).
  - Sampling rate: 128 samples/second.
- **Output**:
  - HR vs. Time plots for all signals.

---

### 3. **Loudness Segmentation**
- **Objective**: Identify loud words in speech samples.
- **Description**:
  - Task 1: Identify louder words using provided start and end times.
  - Task 2: Identify louder words without start and end time information.
- **Input**:
  - Speech samples and corresponding text files with timing and loudness labels.
- **Output**:
  - Segmentation results for loud words.

---

## File Structure
```
Project_BirdRecognition/
    Reference/
    Task/
    Scripts/
Project_HeartRateEstimation/
    Reference/
    Outputs/
    Scripts/
Project_LouderWordsDetection/
    Reference/
    Outputs/
    Scripts/
```

---

## How to Run
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/SignalProcessingProjects.git
   cd SignalProcessingProjects
   ```
2. Navigate to the desired project folder and follow the instructions in the respective `Scripts` folder.

3. Make sure the task files and the reference files are in the desired folder.

---

## Tools and Libraries
- MATLAB
- Signal processing toolkits for audio and ECG analysis.

---

## Contributors
- **Priyanshi Jain**  
- **Valli G.**
- **Ritama Sanyal**

Feel free to contact me for queries or collaborations.

---
