%Discrete-Time Fourier Transform (DTFT) of a Finite-Duration Sequence.
clc; clear; close all; 
% Input sequence 
x = [1 2 3 4 5]; 
N = length(x); 
% Frequency samples (501 points between 0 and pi) 
w = linspace(0, pi, 501); 
% Compute DTFT manually 
X = zeros(size(w)); 
for k = 1:length(w) 
X(k) = sum(x .* exp(-1j*w(k)*(0:N-1))); 
end 
% Plot results 
figure; 
subplot(2,2,1); 
plot(w, abs(X), 'b','LineWidth',1.2); 
xlabel('\omega (rad/sample)'); ylabel('|X(e^{j\omega})|'); 
title('Magnitude Spectrum'); grid on; 
subplot(2,2,2); 
plot(w, angle(X), 'r','LineWidth',1.2); 
xlabel('\omega (rad/sample)'); ylabel('Phase (radians)'); 
title('Phase Spectrum'); grid on; 
subplot(2,2,3); 
plot(w, real(X), 'g','LineWidth',1.2); 
xlabel('\omega (rad/sample)'); ylabel('Re\{X\}'); 
title('Real Part'); grid on; 
subplot(2,2,4); 
plot(w, imag(X), 'm','LineWidth',1.2); 
xlabel('\omega (rad/sample)'); ylabel('Im\{X\}'); 
title('Imaginary Part'); grid on; 