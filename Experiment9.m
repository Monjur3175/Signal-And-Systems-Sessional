% Removing noise from an audio signal. 
clc; 
clear all; 
close all; 
% Step a: Generate an audio signal (pure sine wave, 440 Hz) 
Fs = 8000;              
T = 1/Fs;               
L = 2000;               
t = (0:L-1)*T;          
f = 440;                
x = sin(2*pi*f*t);      
% Sampling frequency (Hz) 
% Sampling period 
% Length of signal (number of samples) 
% Time vector 
% Frequency of sine wave (Hz) 
% Pure sine wave 
% Step b: Add random noise 
noisy_signal = x + 0.5*randn(size(t)); 
% Step c: Apply DFT (FFT in MATLAB) 
Y = fft(noisy_signal); 
% Frequency axis for plotting 
f_axis = Fs*(0:(L/2))/L; 
% Step d: Filter high frequencies 
% Design a simple low-pass filter by zeroing out frequencies above 1000 Hz 
cutoff = 1000;   % Hz 
Y_filtered = Y; 
Y_filtered(abs((0:L-1)-L/2) > cutoff*L/Fs) = 0;  % crude filtering 
% Step e: Apply Inverse DFT 
cleaned_signal = ifft(Y_filtered, 'symmetric'); 
% -------- Plot Results -------- 
figure; 
subplot(3,1,1); 
plot(t(1:500), noisy_signal(1:500)); 
title('Noisy Signal (Time Domain)'); 
xlabel('Time (s)'); 
ylabel('Amplitude'); 
subplot(3,1,2); 
P2 = abs(Y/L); 
P1 = P2(1:L/2+1); 
P1(2:end-1) = 2*P1(2:end-1); 
plot(f_axis, P1); 
title('Frequency Spectrum of Noisy Signal'); 
xlabel('Frequency (Hz)'); 
ylabel('|Amplitude|'); 
subplot(3,1,3); 
plot(t(1:500), cleaned_signal(1:500)); 
title('Cleaned Signal (Time Domain)'); 
xlabel('Time (s)'); 
ylabel('Amplitude'); 
% Optional: Play sounds 
% sound(x, Fs);             
% pause(2); 
% Original sine wave 
% sound(noisy_signal, Fs);  % Noisy signal 
% pause(2); 
% sound(cleaned_signal, Fs);% Cleaned signal 