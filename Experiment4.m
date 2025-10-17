clc; clear all; close all;

% Define the signal
n = -5:5;                 % Range of n
x1 = n;                    % Example signal 1: x1(n) = n
x2 = n.^2;                 % Example signal 2: x2(n) = n^2


y_add = x1 + x2;


y_fold = fliplr(x1);

shift_value = -2; % positive for right shift, negative for left
y_shift = zeros(size(x1)); % initialize
if shift_value >= 0
    y_shift((shift_value+1):end) = x1(1:end-shift_value);
else
    y_shift(1:end+shift_value) = x1((-shift_value+1):end);
end

% Plot the results
figure;

subplot(5,1,1);
stem(n, x1, 'filled'); grid on;
title('Original signal of x1');
xlabel('n'); ylabel('Amplitude');

subplot(5,1,2);
stem(n, x2, 'filled'); grid on;
title('Original signal of x2');
xlabel('n'); ylabel('Amplitude');

subplot(5,1,3);
stem(n, y_add, 'filled'); grid on;
title('Signal Addition: x1(n) + x2(n)');
xlabel('n'); ylabel('Amplitude');

subplot(5,1,4);
stem(n, y_fold, 'filled'); grid on;
title('Signal Folding: x1(-n)');
xlabel('n'); ylabel('Amplitude');

subplot(5,1,5);
stem(n, y_shift, 'filled'); grid on;
title(['Signal Shifting: x1(n ', num2str(shift_value), ')']);
xlabel('n'); ylabel('Amplitude');