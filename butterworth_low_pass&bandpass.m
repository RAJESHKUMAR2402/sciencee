clc;
close all;
clear all;
pkg load signal;
format long
%low pass filter

rp = input("Enter the passband ripple (rp in dB): ");
rs = input("Enter the stopband ripple (rs in dB): ");
wp = input("Enter the passband frequency (wp in Hz): ");
ws = input("Enter the stopband frequency (ws in Hz): ");
fs = input("Enter the sampling frequency (fs in Hz): ");

w1 = 2 * wp / fs;
w2 = 2 * ws / fs;

[n, wn] = buttord(w1, w2, rp, rs);
disp(['Filter order: ', num2str(n)]);

[b, a] = butter(n, wn);

disp(['Low-pass filter cutoff frequency (normalized): ', num2str(wn)]);
disp(['Low-pass filter cutoff frequency (Hz): ', num2str(wn * fs / 2)]);

[h, om] = freqz(b, a, 512, fs);
m = 20 * log10(abs(h));
an = angle(h);

figure;
subplot(2, 1, 1);
plot(om, m);
ylabel("Gain in dB");
xlabel("Frequency (Hz)");
title("Magnitude Response (Low-Pass Filter)");

subplot(2, 1, 2);
plot(om, an);
xlabel("Frequency (Hz)");
ylabel("Phase (radians)");
title("Phase Response (Low-Pass Filter)");

%bandpass filter
rp = input("Enter the passband ripple for BPF (rp in dB): ");
rs = input("Enter the stopband ripple for BPF (rs in dB): ");
wp = input("Enter the passband frequency (wp in Hz): ");
ws = input("Enter the stopband frequency (ws in Hz): ");
fs = input("Enter the sampling frequency (fs in Hz): ");

w1 = 2 * wp / fs;
w2 = 2 * ws / fs;

[n, wn] = buttord([w1, w2], [w1 * 0.8, w2 * 1.2], rp, rs);
disp(['Filter order (BPF): ', num2str(n)]);

[b, a] = butter(n, [w1, w2], 'bandpass');

disp(['Band-pass filter cutoff frequencies (normalized): ', num2str(wn)]);
disp(['Band-pass filter cutoff frequencies (Hz): ', num2str(wn * fs / 2)]);

[h, om] = freqz(b, a, 512, fs);
m = 20 * log10(abs(h));
an = angle(h);

figure;
subplot(2, 1, 1);
plot(om, m);
ylabel("Gain in dB");
xlabel("Frequency (Hz)");
title("Magnitude Response (Band-Pass Filter)");

subplot(2, 1, 2);
plot(om, an);
xlabel("Frequency (Hz)");
ylabel("Phase (radians)");
title("Phase Response (Band-Pass Filter)");

%input low pass filter

%Passband ripple=0.5
%Stopband ripple=50
%Passband freq=1200
%Stop band freq=2400
%Sampling freq=15000
%Order of the filter = 6
%Cut off frequency= 0.16

%input band pass
% Passband ripple=0.25
%Stopband ripple=20
%Passband freq=1200
%Stop band freq=2400
%Sampling freq=15000
%Order of the filter = 3
%Cut off frequency= [0.24,0.48]

