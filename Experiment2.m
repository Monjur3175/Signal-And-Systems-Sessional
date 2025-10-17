% Given sequence
x = [1 2 3 4 5 6 7 6 5 4 3 2 1];
n = -4:8;  % 0 index at element 5 ? n = -4 to 8

% Compute y[n] = 2x[n-5] - 3x[n+4]
n_shift = n;
x_shift_minus5 = [zeros(1,5), x(1:end-5)];
x_shift_plus4 = [x(5:end), zeros(1,4)];

y = 2*x_shift_minus5 - 3*x_shift_plus4;

stem(n_shift, y, 'filled');
title('y[n] = 2x[n-5] - 3x[n+4]');
xlabel('n'); ylabel('Amplitude');