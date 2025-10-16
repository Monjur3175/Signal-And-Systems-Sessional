%Determine and Plot the Discrete-Time Sequence: 
%X(n)=2?(n+2)??(n?4)  where ?7?n?7

n = -7:7;

% Define unit impulse function
delta = @(n0, n_vec) double(n_vec == n0);

% Construct x[n] = 2*delta(n + 2) - delta(n - 4)
x = 2 * delta(-2, n) - delta(4, n);

% Plot
stem(n, x, 'filled');
title('x[n] = 2\delta(n+2) - \delta(n-4)');
xlabel('n');
ylabel('x[n]');
grid on;