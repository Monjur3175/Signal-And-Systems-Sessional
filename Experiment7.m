clc
clear all
close all

% 1. Signal Parameters
Fa = 10; % Analog Frequency
Fs = 640; % Sampling Frequency
Ts = 1/Fs; % Sampling Period
T_period = 1/Fa; % Period of the fundamental frequency

% 2. Analog Signal Generation (Time Domain)
% For visualization of the continuous signal
t_analog = 0 : T_period/99 : T_period;
y_analog = 5*sin(2*pi*Fa*t_analog) + 2*sin(2*pi*2*Fa*t_analog) + 2*sin(2*pi*3*Fa*t_analog);

figure(1)
plot(t_analog, y_analog);
title('Analog Signal (Continuous)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% 3. Discrete Signal Sampling
N = round(T_period / Ts); % Number of samples in one period
n_sample = 0 : N-1; % Sample index
t_discrete = n_sample * Ts; % Time vector for discrete samples

% Sampled Signal
y_discrete = 5*sin(2*pi*Fa*t_discrete) + 2*sin(2*pi*2*Fa*t_discrete) + 2*sin(2*pi*3*Fa*t_discrete);

figure(2)
stem(n_sample, y_discrete);
title('Discrete Sampled Signal');
xlabel('Sample Index (n)');
ylabel('Amplitude');
grid on;

% 4. Custom DFT Implementation (Forward Transform)
X_k = zeros(1, N); % Initialize the DFT result vector
for k = 0 : N-1 % Frequency index (k)
    sum_val = 0;
    for n = 0 : N-1 % Time index (n)
        % DFT formula: X[k] = sum( x[n] * exp(-j*2*pi*k*n/N) )
        sum_val = sum_val + y_discrete(n+1) * exp(-1i * 2 * pi * k * n / N);
    end
    X_k(k+1) = sum_val;
end

% 5. Plotting the DFT Magnitude Spectrum
% Frequency vector for plotting. We use fftshift to center the 0 Hz component.
f_shift = Fs * ((-N/2) : (N/2)-1) / N;

figure(3)
% Use abs() for magnitude and fftshift() to center the spectrum at 0 Hz
stem(f_shift, abs(fftshift(X_k)));
title('Custom DFT Magnitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude |X[k]|');
% Axis limits to focus on the signal's core frequencies (10, 20, 30 Hz)
axis([ -50 50 0 (N*5.2)]); % N*5 is the expected peak height for the 5*sin component
grid on;


% 6. IDFT Implementation (Inverse Transform)
% The input for IDFT is the DFT result, X_k
X_k_input = X_k;
x_n_reconstructed = zeros(1, N); % Initialize the IDFT result vector

for n = 0 : N-1 % Time index (n)
    sum_val = 0;
    for k = 0 : N-1 % Frequency index (k)
        % IDFT formula: x[n] = (1/N) * sum( X[k] * exp(j*2*pi*k*n/N) )
        sum_val = sum_val + X_k_input(k+1) * exp(1i * 2 * pi * k * n / N);
    end
    x_n_reconstructed(n+1) = sum_val / N; % Divide by N is crucial
end

% 7. Plotting the IDFT Result
% The reconstructed signal should be identical to the original discrete signal (y_discrete)
figure(4)
% We plot the REAL part because the original signal was purely real, and small 
% imaginary parts might arise due to floating-point errors.
stem(t_discrete, real(x_n_reconstructed));
title('IDFT Reconstructed Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% 8. Comparison with Built-in MATLAB Functions (Verification)
% X_k_builtin = fft(y_discrete);
% x_n_builtin = ifft(X_k_builtin);
% 
% figure(5)
% stem(f_shift, abs(fftshift(X_k_builtin)));
% title('Built-in FFT Magnitude Spectrum');
% xlabel('Frequency (Hz)');
% ylabel('Magnitude |X[k]|');
% grid on;
% 
% figure(6)
% stem(t_discrete, real(x_n_builtin));
% title('Built-in IFFT Reconstructed Signal');
% xlabel('Time (s)');
% ylabel('Amplitude');
% grid on;