% Experiment 4: Signal Operations (Addition, Folding, Shifting)

function exp4_signal_operations()
    n = -5:5;
    x = [zeros(1,3), 1:6, zeros(1,2)];
    h = [zeros(1,2), 2:7, zeros(1,3)];

    % Addition
    y1 = x + h;
    subplot(3,1,1);
    stem(n, y1, 'filled');
    title('Signal Addition: x[n] + h[n]');
    xlabel('n'); ylabel('Amplitude');

    % Folding
    y2 = fliplr(x);
    subplot(3,1,2);
    stem(-n, y2, 'filled');
    title('Signal Folding: x[-n]');
    xlabel('n'); ylabel('Amplitude');

    % Shifting
    k = 2;
    y3 = [zeros(1,k), x(1:end-k)];
    subplot(3,1,3);
    stem(n, y3, 'filled');
    title('Signal Shifting: x[n-2]');
    xlabel('n'); ylabel('Amplitude');
end