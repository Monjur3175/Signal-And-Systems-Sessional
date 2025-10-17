clc; clear all; close all;

% Define the signal
n = -5:5;                 % Range of n
x1 = n;                    % Example signal 1: x1(n) = n
x2 = n.^2;                 % Example signal 2: x2(n) = n^2

% 1) Signal Addition
y_add = x1 + x2;

% 2) Signal Folding
y_fold = fliplr(x1);       % flip the values
n_fold = -fliplr(n);       % flip the indices

% 3) Signal Shifting
shift_value = 3;            % positive ? right, negative ? left
y_shift = zeros(size(x1));
if shift_value >= 0
    y_shift((shift_value+1):end) = x1(1:end-shift_value);
else
    y_shift(1:end+shift_value) = x1((-shift_value+1):end);
end
n_shift = n + shift_value;  % adjust indices

% Plot the results
figure;

subplot(5,1,1);
stem(n, x1, 'filled'); grid on;
title('Original signal x1(n)');
xlabel('n'); ylabel('Amplitude');

subplot(5,1,2);
stem(n, x2, 'filled'); grid on;
title('Original signal x2(n)');
xlabel('n'); ylabel('Amplitude');

subplot(5,1,3);
stem(n, y_add, 'filled'); grid on;
title('Signal Addition: x1(n) + x2(n)');
xlabel('n'); ylabel('Amplitude');

subplot(5,1,4);
stem(n_fold, y_fold, 'filled'); grid on;
title('Signal Folding: x1(-n)');
xlabel('n'); ylabel('Amplitude');

subplot(5,1,5);
stem(n_shift, y_shift, 'filled'); grid on;
title(['Signal Shifting: x1(n -', num2str(shift_value), ')']);
xlabel('n'); ylabel('Amplitude');