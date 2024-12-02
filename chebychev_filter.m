% Low Pass Filter
clear all;
clc;
close all;
rp = input('Enter the pass band ripple (dB): ');
rs = input('Enter the stop band ripple (dB): ');
wp = input('Enter the pass band frequency (Hz): ');
ws = input('Enter the stop band frequency (Hz): ');
fs = input('Enter the sampling frequency (Hz): ');

% Normalize frequencies
w1 = 2 * wp / fs;
w2 = 2 * ws / fs;

% Design Low Pass Filter
[n, wn] = cheb1ord(w1, w2, rp, rs); % Get filter order
[b, a] = cheby1(n, rp, wn);         % Design analog filter
[bz, az] = impinvar(b, a, fs);      % Convert to digital filter

% Display coefficients
disp('Low Pass Filter Coefficients:');
disp('bz = ');
disp(bz);
disp('az = ');
disp(az);

% Frequency Response of Low Pass Filter
w = 0:0.01:pi;
[h, om] = freqz(bz, az, w);         % Use digital coefficients
m = 20 * log10(abs(h));
an = angle(h);

% Display results
disp('Filter order:');
disp(n);
disp('Cut-off frequency:');
disp(wn);

% Plot Gain and Phase Response for LPF
figure;
subplot(2, 1, 1);
plot(om / pi, m);
ylabel('Gain (dB)');
xlabel('(a) Normalized Frequency');
title('Low Pass Filter');

subplot(2, 1, 2);
plot(om / pi, an);
xlabel('(b) Normalized Frequency');
ylabel('Phase (radians)');

% Band Pass Filter
rp = input('Enter the pass band ripple (dB): ');
rs = input('Enter the stop band ripple (dB): ');
wp = input('Enter the pass band frequency (Hz): ');
ws = input('Enter the stop band frequency (Hz): ');

% Normalize frequencies
w1 = 2 * wp / fs;
w2 = 2 * ws / fs;

% Design Band Pass Filter
[n, wn] = cheb1ord(w1, w2, rp, rs); % Get filter order
[b, a] = cheby1(n, rp, wn, 'bandpass'); % Design bandpass analog filter
[bz, az] = impinvar(b, a, fs);          % Convert to digital filter

% Display coefficients
disp('Band Pass Filter Coefficients:');
disp('bz = ');
disp(bz);
disp('az = ');
disp(az);

% Frequency Response of Band Pass Filter
[h, om] = freqz(bz, az, w); % Use digital coefficients
m = 20 * log10(abs(h));
an = angle(h);

% Display results
disp('Filter order:');
disp(n);
disp('Cut-off frequency:');
disp(wn);

% Plot Gain and Phase Response for BPF
figure;
subplot(2, 1, 1);
plot(om / pi, m);
ylabel('Gain (dB)');
xlabel('(a) Normalized Frequency');
title('Band Pass Filter');

subplot(2, 1, 2);
plot(om / pi, an);
xlabel('(b) Normalized Frequency');
ylabel('Phase (radians)');

