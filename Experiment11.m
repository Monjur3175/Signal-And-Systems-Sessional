%Power Density Spectrum of a Square 
Wave
clc; 
clear; 
close all; 
A = 1;  % Amplitude 
T = 2*pi;  % Period 
w0 = 2*pi/T;  % Fundamental frequency 
N = 25;  % Number of harmonics 
%Fourier coefficients 
n = -N:N;  
Cn = zeros(size(n));  
for k = 1:length(n)  
if mod(n(k),2) ~= 0  % only odd harmonics  
Cn(k) = 2*A/(1j*n(k)*pi);  
else  
Cn(k) = 0;  
end  
end  
%Power spectrum (|Cn|^2)  
P = abs(Cn).^2; 
%Plot line spectrum  
stem(n*w0, P, 'filled');  
xlabel('Frequency (rad/s)');  
ylabel('|C_n|^2 (Power)');  
title('Power Density Spectrum of Square Wave');  
grid on;