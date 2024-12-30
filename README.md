# BM4152 Biosignal Processing

This repository contains the solutions to the BM4152 Biosignal Processing assignments, which involve advanced MATLAB-based signal processing techniques applied to biomedical signals. These assignments focus on implementing digital filters, adaptive and optimum filters, wavelet transforms, and EEG analysis using EEGLAB.

## Repository Structure
- **Assignment 1**: Digital Filters
- **Assignment 2**: Optimum and Adaptive Filters
- **Assignment 3**: Continuous and Discrete Wavelet Transforms
- **EEG Lab**: Multi-channel EEG Analysis Using EEGLAB

Each folder contains:
- A detailed report in PDF format with observations, discussions, and relevant plots.
- MATLAB scripts (*.m files) with comments for better readability.

---

## Assignment Details

### **Assignment 1: Digital Filters**
The assignment involves implementing digital filters to process biomedical signals like ECG. Key topics include:
- Smoothing filters: Moving Average (MA) and Savitzky-Golay filters.
- Ensemble averaging for noise reduction.
- FIR and IIR filter design and application.
- Comparison of FIR and IIR filtering methods.

**MATLAB Topics Covered**:
- Implementation of filters from scratch and using built-in MATLAB functions.
- Visualization of signal spectra, magnitude, and phase responses.
- Mean squared error (MSE) calculations to optimize filter parameters.

---

### **Assignment 2: Optimum and Adaptive Filters**
This assignment focuses on Wiener filters and adaptive filtering using LMS and RLS algorithms. Key tasks include:
- Discrete and frequency-domain Wiener filter implementations.
- Handling non-stationary noise.
- Adaptive filtering with LMS and RLS methods.

**MATLAB Topics Covered**:
- Design and implementation of adaptive filters.
- Analysis of signal spectra and adaptation rates.
- Comparison of LMS and RLS performance.

---

### **Assignment 3: Continuous and Discrete Wavelet Transforms**
This assignment explores wavelet-based signal processing techniques for biomedical applications, including:
- Continuous Wavelet Transform (CWT) for non-stationary signals.
- Discrete Wavelet Transform (DWT) for efficient analysis.
- Applications of wavelet transforms in denoising and compression.

**MATLAB Topics Covered**:
- Construction and properties of wavelets.
- Wavelet decomposition and reconstruction using MATLAB Wavelet Toolbox.
- Signal denoising and compression with DWT.

---

### **EEG Lab: Multi-channel EEG Analysis Using EEGLAB**
This assignment utilizes EEGLAB, an open-source MATLAB toolbox, for multi-channel EEG analysis. Key tasks include:
- Installation and configuration of EEGLAB.
- Time and frequency domain analysis of EEG data.
- Re-referencing and event renaming for improved analysis.
- Data segmentation and artifact rejection.
- Independent Component Analysis (ICA) for isolating noise and artifacts.
- Channel spectra and scalp maps visualization.

**MATLAB Topics Covered**:
- EEG data preprocessing using EEGLAB.
- ICA for separating EEG components from artifacts like eye movements and muscle activity.
- Advanced spectral and topographical analysis.

---

### **Paper Implementation**
- The paper implementation task contains in [This repository](https://github.com/RavinduMPK/EEG-signal-classification-using-PCA--ICA--LDA-and-support-vector-machines)

## Usage

### Prerequisites
- MATLAB with Signal Processing Toolbox and Wavelet Toolbox.
- EEGLAB toolbox for MATLAB.

### Running the Scripts
1. Clone the repository:
    ```bash
    git clone https://github.com/username/biosignal-processing.git
    cd biosignal-processing
    ```
2. Navigate to the desired assignment folder.
3. Open the MATLAB scripts in MATLAB.
4. Run the scripts in the specified order.

---

## Author
- **Name**: Ravindu Pushpakumara
- **Course**: BM4152 Biosignal Processing
- **Institution**: University of Moratuwa, Sri Lanka

---


