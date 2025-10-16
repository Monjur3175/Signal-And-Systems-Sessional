% To find the amplitude of the multi frequency signal: 
%X(t)= cos(2?100t) + cos(2?500t) +cos(2?700t) 
%And also show approximate the Fourier transform integral for 0?f?900 Hz. 
clc; 
clear all; 
close all; 
% Parameters 
Fs = 5000;   
T = 1;      
% Sampling frequency (Hz) - must be > 
% Duration (s) -> frequency resolution 
t = 0:1/Fs:T-1/Fs; 
% Multi-frequency signal 
x = cos(2*pi*100*t) + cos(2*pi*500*t) + cos(2*pi*700*t); 
% FFT 
N = length(x); 
X = fft(x); 
f = (0:N-1)*(Fs/N);    
% Frequency axis 
% Single-sided amplitude spectrum 
X_mag = abs(X)/N;          
% Normalize 
X_mag = 2*X_mag(1:N/2+1);  % Keep positive side & scale 
f = f(1:N/2+1); 
% Plot (limit to 0..900 Hz) 
figure; 
plot(f, X_mag, 'b', 'LineWidth', 1.5); 
grid on; 
xlim([0 900]); 
ylim([0 1.2]); 
xlabel('Frequency (Hz)'); 
ylabel('Amplitude'); 
title('Amplitude Spectrum of Multi-Frequency Signal (0-900 Hz)');