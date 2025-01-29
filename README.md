# Fourier-Analysis-Exploration

## Project Overview
This project focuses on Fourier analysis, sampling, reconstruction, and aliasing in signal processing using MATLAB. It consists of two main components:
1. **Fourier Analysis:** Implementation of Fourier Series and Fourier Transform.
2. **Sampling and Reconstruction:** Investigating the effects of different sampling rates and reconstructing signals.

---

## Project Structure
```
EECE340_Project/
│── 1_FourierAnalysis/
│   │── ffs.m              # Fourier Series Implementation
│   │── ftr.m              # Fourier Transform Implementation
│   │── iftr.m             # Inverse Fourier Transform
│   │── main1.m            # Main script for Fourier Analysis
│
│── 2_SamplingReconstruction/
│   │── sample.m           # Sampling function
│   │── reconstruct.m      # Signal Reconstruction function
│   │── main_samp_rec.m    # Main script for sampling & reconstruction
│   │── main_Real.m        # Real-world application testing
│   │── 19_R.csv           # Sampled data (Right)
│   │── 25_L.csv           # Sampled data (Left)
│   │── 27_B.csv           # Sampled data (Blink)
```

---

## Running the Project

### 1. Fourier Analysis
To analyze Fourier representations, execute:
```matlab
main1;
```
This will:
- Compute and plot Fourier Series approximations.
- Compute and plot Fourier Transform results.
- Perform error analysis based on different parameters.

### 2. Sampling and Reconstruction
To investigate sampling effects and reconstruct signals, execute:
```matlab
main_samp_rec;
```
This will:
- Sample signals at different rates (0.5*fN, 2*fN, and 4*fN).
- Reconstruct signals and compare results.

### 3. Real-world Signal Processing
To process real-world eye movement data (Blink, Left, Right), execute:
```matlab
main_Real;
```
This will:
- Read sampled data from CSV files.
- Apply sampling and reconstruction.
- Plot the results for different conditions.

---

## Function Descriptions

### 1. Fourier Analysis
- **`ffs.m`**: Computes the Fourier Series approximation of a signal.
- **`ftr.m`**: Computes the Fourier Transform of a signal.
- **`iftr.m`**: Computes the Inverse Fourier Transform.

### 2. Sampling & Reconstruction
- **`sample.m`**: Samples a signal at a given rate.
- **`reconstruct.m`**: Reconstructs a signal using sinc interpolation.
- **`main_samp_rec.m`**: Compares sampling and reconstruction at different rates.
- **`main_Real.m`**: Processes real-world signals and applies sampling and reconstruction.

---

## Notes
- Ensure all `.csv` files are in the same directory as `main_Real.m`.
- MATLAB's built-in functions for Fourier analysis are not used to ensure manual implementation.
- Modify sampling rates in `main_samp_rec.m` as needed for further experimentation.

---

## Contributors
This project was completed by Lynn Ariss, Raghad Al Agha and Claritta Khoury as part of the EECE 340 course at the American University of Beirut.

