% Let x[n]={1,2,3,4,5,6,7,6,5,4,3,2,1}.Here bold number 
%indicates the 0 index. Determine and plot the following sequences. 
%y[n]=2x[n?5]?3x[n+4]. 
clc; clear; close all;

% Given sequence
x = [1 2 3 4 5 6 7 6 5 4 3 2 1];
n = -6:6;             % Since middle (7th element) is x[0]

% Define y[n] = 2x[n?5] ? 3x[n+4]
n_shift1 = n + 5;      % For x[n?5] -> shift right by 5
n_shift2 = n - 4;      % For x[n+4] -> shift left by 4

% Define a common range for n
n_y = -15:15;

% Initialize with zeros
x_shift1 = zeros(size(n_y));
x_shift2 = zeros(size(n_y));

% Insert shifted sequences
x_shift1(ismember(n_y, n_shift1)) = x;
x_shift2(ismember(n_y, n_shift2)) = x;

% Compute y[n]
y = 2 * x_shift1 - 3 * x_shift2;

% Plot
stem(n_y, y, 'filled');
title('y[n] = 2x[n-5] - 3x[n+4]');
xlabel('n');
ylabel('Amplitude');
grid on;
