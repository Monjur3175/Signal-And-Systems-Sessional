% Experiment 1: Elementary Discrete Signals
clc;
clear all;
close all;
n = -10:10;

% Unit Sample Sequence
x1 = (n == 0);
subplot(3,1,1);
stem(n, x1, 'filled');
title('Unit Sample Sequence');
xlabel('n'); ylabel('x[n]');

% Unit Step Signal
x2 = (n >= 0);
subplot(3,1,2);
stem(n, x2, 'filled');
title('Unit Step Signal');
xlabel('n'); ylabel('x[n]');

% Unit Ramp Signal
x3 = n .* (n >= 0);
subplot(3,1,3);
stem(n, x3, 'filled');
title('Unit Ramp Signal');
xlabel('n'); ylabel('x[n]');