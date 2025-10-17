clc; clear all; close all;

% Original sequence
x = [1 2 3 4 5 6 7 6 5 4 3 2 1];
n = -4:8;  % x(0) = 5th element

% Zero-padding for safe shifting
x = [zeros(1,10) x zeros(1,10)];
n_ext = -14:18;

% Generate shifted versions
x_shift_right = x(find(n_ext==-4)-5 : find(n_ext==8)-5); % x(n-5)
x_shift_left  = x(find(n_ext==-4)+4 : find(n_ext==8)+4); % x(n+4)

% Scale them
a = 2 * x_shift_right;   % 2x(n-5)
b = 3 * x_shift_left;    % 3x(n+4)

% Output sequence
y = a - b;               % y(n) = 2x(n-5) - 3x(n+4)

% ---------------- PLOTTING ----------------

subplot(3,1,1);
stem(n, a, 'r', 'filled');
title('2 × x(n-5)');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(3,1,2);
stem(n, b, 'g', 'filled');
title('3 × x(n+4)');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(3,1,3);
stem(n, y, 'b', 'filled');
title('Output: y(n) = 2x(n-5) - 3x(n+4)');
xlabel('n'); ylabel('y(n)');
grid on;
