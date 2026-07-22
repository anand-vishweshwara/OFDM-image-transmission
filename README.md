# OFDM Image Transmission using MATLAB

## Overview

This project implements an **Orthogonal Frequency Division Multiplexing (OFDM)** system in MATLAB for image transmission over wireless communication channels. The performance of the system is evaluated under **Additive White Gaussian Noise (AWGN)** and **Rayleigh Fading** channels using **Bit Error Rate (BER)** and **Peak Signal-to-Noise Ratio (PSNR)** metrics.

---

## Features

- OFDM modulation and demodulation
- Adaptive modulation
- Image transmission and reconstruction
- AWGN channel simulation
- Rayleigh fading channel simulation
- BER vs SNR performance analysis
- PSNR vs SNR performance analysis
- MATLAB implementation

---

## Project Workflow

1. Read the input image.
2. Convert the image into a binary bit stream.
3. Perform OFDM modulation.
4. Transmit the signal through:
   - AWGN Channel
   - Rayleigh Fading Channel
5. Perform OFDM demodulation.
6. Reconstruct the received image.
7. Calculate BER and PSNR for different SNR values.
8. Compare the transmission performance.

---

## Results

### BER vs SNR

![BER vs SNR](BER_vs_SNR.png)

---

### PSNR vs SNR

![PSNR vs SNR](PSNR_vs_SNR.png)

---

### Transmitted Image

![Transmitted Image](Transmitted_Image.png)

---

### Received Image

![Received Image](Received_Image.png)

---

## Tools Used

- MATLAB
- Signal Processing
- Digital Communication Techniques

---

## How to Run

1. Open **ofdm.m** in MATLAB.
2. Ensure the input image is accessible (either through the image URL used in the code or by updating the code to use a local image file).
3. Run the script.
4. Observe:
   - BER vs SNR graph
   - PSNR vs SNR graph
   - Transmitted image
   - Received image

---

## Applications

- Wireless Communication Systems
- OFDM-based Communication
- Digital Signal Processing
- Image Transmission
- Communication System Performance Analysis

---

## Future Improvements

- Support higher-order modulation schemes (16-QAM, 64-QAM)
- Implement channel coding techniques
- Evaluate frequency-selective fading channels
- Real-time implementation using Software Defined Radio (SDR)
- FPGA implementation of the OFDM transmitter and receiver


---

## Author

**Anand Vishweshwara**

Electronics and Communication Engineering (ECE)

Vasavi College of Engineering

Hyderabad, India
