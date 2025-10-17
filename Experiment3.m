clc;
clear;
close all;

% Define n range
n = -7:7;

% Initialize each sequence as zeros
x1 = zeros(size(n)); % 2*delta(n+2)
x2 = zeros(size(n)); % -delta(n-4)

% Define the impulses
x1(n == -2) = 2;  % 2*delta(n+2)
x2(n == 4)  = -1; % -delta(n-4)

% Combined sequence
x = x1 + x2;

% Plot each separately
figure;

subplot(3,1,1);
stem(n, x1, 'filled', 'b');
title('2\delta(n+2)');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(3,1,2);
stem(n, x2, 'filled', 'r');
title('-\delta(n-4)');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(3,1,3);
stem(n, x, 'filled', 'g');
title('Combined Sequence X(n) = 2\delta(n+2) - \delta(n-4)');
xlabel('n'); ylabel('Amplitude');
grid on;