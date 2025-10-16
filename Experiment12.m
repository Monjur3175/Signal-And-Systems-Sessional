% Square Wave Approximation using Fourier Series 
clc;  
clear; 
close all; 
% Parameters 
T = 2*pi;  % Period % 
w0 = 2*pi/T;    % Fundamental frequency 
t = linspace(-2*T, 2*T, 2000);  % Time axis 
% Fourier Series Approximation  
N = 50; % Number of harmonics  
x_approx = zeros(size(t)); 
for k = 1:2:N % only odd harmonics 
x_approx = x_approx + (4/pi)*(1/k)*sin(k*w0*t); 
end  
% Plot  
plot(t, x_approx, 'b', 'LineWidth', 1.5); 
xlabel('Time (s)');  
ylabel('Amplitude');  
title(['Square Wave Approximation with N = ' num2str(N) ' harmonics']);  
grid on; 
ylim([-1.5 1.5]);