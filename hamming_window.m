% FIR Filter Design using Hamming Window
clc;
clear;

% Input number of samples (filter order)
n = input('Enter the number of samples (positive integer): ');

% Input for Low Pass Filter
w = input('Enter the cut-off frequency (normalized, between 0 and 1): ');

% Low Pass Filter using Hamming window
disp('LPF using Hamming window');
lpf = fir1(n - 1, w, 'low', hamming(n));  % FIR filter design
[h, f] = freqz(lpf, 1, 256);  % Frequency response
m = 20 * log10(abs(h));  % Gain in dB
subplot(2, 2, 1);
plot(f / pi, m);
grid on;  % Added grid for better readability
ylabel('Gain in dB');
xlabel('Normalized Frequency (\times\pi rad/sample)');
title('LPF using Hamming Window');

% High Pass Filter
disp('HPF using Hamming window');
hpf = fir1(n - 1, w, 'high', hamming(n));  % FIR filter design
[h, f] = freqz(hpf, 1, 256);  % Frequency response
m = 20 * log10(abs(h));  % Gain in dB
subplot(2, 2, 2);
plot(f / pi, m);
grid on;  % Added grid for better readability
ylabel('Gain in dB');
xlabel('Normalized Frequency (\times\pi rad/sample)');
title('HPF using Hamming Window');

% Band Pass Filter
wc1 = input('Enter the first cut-off frequency for BPF (normalized, between 0 and 1): ');
wc2 = input('Enter the second cut-off frequency for BPF (normalized, between 0 and 1): ');
wn = [wc1 wc2];
disp('BPF using Hamming window');
bpf = fir1(n - 1, wn, 'bandpass', hamming(n));  % FIR filter design
[h, f] = freqz(bpf, 1, 256);  % Frequency response
m = 20 * log10(abs(h));  % Gain in dB
subplot(2, 2, 3);
plot(f / pi, m);
grid on;  % Added grid for better readability
ylabel('Gain in dB');
xlabel('Normalized Frequency (\times\pi rad/sample)');
title('BPF using Hamming Window');

% Band Stop Filter
wc3 = input('Enter the first cut-off frequency for BSF (normalized, between 0 and 1): ');
wc4 = input('Enter the second cut-off frequency for BSF (normalized, between 0 and 1): ');
wn = [wc3 wc4];
disp('BSF using Hamming window');
bsf = fir1(n - 1, wn, 'stop', hamming(n));  % FIR filter design
[h, f] = freqz(bsf, 1, 256);  % Frequency response
m = 20 * log10(abs(h));  % Gain in dB
subplot(2, 2, 4);
plot(f / pi, m);
grid on;  % Added grid for better readability
ylabel('Gain in dB');
xlabel('Normalized Frequency (\times\pi rad/sample)');
title('BSF using Hamming Window');

% Adjust the layout
sgtitle('FIR Filter Designs using Hamming Window');


%input
%Enter the number of samples (positive integer): 5
%Enter the cut-off frequency (normalized, between 0 and 1): 0.5
%LPF using Hamming window
%HPF using Hamming window
%Enter the first cut-off frequency for BPF (normalized, between 0 and 1): 0.2
%Enter the second cut-off frequency for BPF (normalized, between 0 and 1): 0.3
%BPF using Hamming window
%Enter the first cut-off frequency for BSF (normalized, between 0 and 1): 0.5
%Enter the second cut-off frequency for BSF (normalized, between 0 and 1): 0.6
%BSF using Hamming window
