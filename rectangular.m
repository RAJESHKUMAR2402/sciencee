clear all;
clc;
disp('Design of FIR Low Pass Filter using Window Function');

% Enter parameters
n = input('Enter the number of samples: ');
fc = input('Enter the cut-off frequency (normalized, between 0 and 1): ');

n = n - 1;  % Adjusting for zero-based indexing

% Low Pass Filter
disp('LPF using rectangular window');
lpf = fir1(n, fc, 'low', rectwin(n + 1));
[h, w] = freqz(lpf, 1, 256);
m = 20 * log10(abs(h));
subplot(2, 2, 1);
plot(w / pi, m);
ylabel('Gain (dB)');
xlabel('Normalized Frequency (\times\pi rad/sample)');
title('LPF using Rectangular Window');

% High Pass Filter
disp('HPF using rectangular window');
hpf = fir1(n, fc, 'high', rectwin(n + 1));
[h, w] = freqz(hpf, 1, 256);
m = 20 * log10(abs(h));
subplot(2, 2, 2);
plot(w / pi, m);
ylabel('Gain (dB)');
xlabel('Normalized Frequency (\times\pi rad/sample)');
title('HPF using Rectangular Window');

% Band Pass Filter
wc1 = input('Enter the first cut-off frequency (normalized, between 0 and 1): ');
wc2 = input('Enter the second cut-off frequency (normalized, between 0 and 1): ');
wn = [wc1 wc2];
disp('BPF using rectangular window');
bpf = fir1(n, wn, 'bandpass', rectwin(n + 1));
[h, w] = freqz(bpf, 1, 256);
m = 20 * log10(abs(h));
subplot(2, 2, 3);
plot(w / pi, m);
ylabel('Gain (dB)');
xlabel('Normalized Frequency (\times\pi rad/sample)');
title('BPF using Rectangular Window');

% Band Stop Filter
wc3 = input('Enter the first cut-off frequency (normalized, between 0 and 1): ');
wc4 = input('Enter the second cut-off frequency (normalized, between 0 and 1): ');
wn = [wc3 wc4];
disp('BSF using rectangular window');
bsf = fir1(n, wn, 'stop', rectwin(n + 1));
[h, w] = freqz(bsf, 1, 256);
m = 20 * log10(abs(h));
subplot(2, 2, 4);
plot(w / pi, m);
ylabel('Gain (dB)');
xlabel('Normalized Frequency (\times\pi rad/sample)');
title('BSF using Rectangular Window');

%input
%ሀDesign of FIR Low Pass Filter using Window Function
%Enter the number of samples: 5
%Enter the cut-off frequency (normalized, between 0 and 1): 0.8
%LPF using rectangular window
%HPF using rectangular window
%Enter the first cut-off frequency (normalized, between 0 and 1): 0.2
%Enter the second cut-off frequency (normalized, between 0 and 1): 0.3
%BPF using rectangular window
%Enter the first cut-off frequency (normalized, between 0 and 1): 0.5
%Enter the second cut-off frequency (normalized, between 0 and 1): 0.6
%BSF using rectangular window

