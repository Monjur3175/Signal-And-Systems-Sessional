% Experiment 5: Convolution of Two Sequences

x = [1 2 3 4];
h = [1 -1 2];

y = conv(x, h);

subplot(3,1,1);
stem(0:length(x)-1, x, 'filled');
title('Input Sequence x[n]');
xlabel('n'); ylabel('Amplitude');

subplot(3,1,2);
stem(0:length(h)-1, h, 'filled');
title('Impulse Response h[n]');
xlabel('n'); ylabel('Amplitude');

subplot(3,1,3);
stem(0:length(y)-1, y, 'filled');
title('Convolution Output y[n] = x[n] * h[n]');
xlabel('n'); ylabel('Amplitude');
