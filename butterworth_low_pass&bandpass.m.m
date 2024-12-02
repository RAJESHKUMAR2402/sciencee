clear all;
clc;
close all;
pkg load signal;

disp("LOW PASS FILTERS");
rp=input('Enter the pass band ripple:');
rs=input('Enter the stop band ripple:');
wp=input('Enter the pass band frequency:');
ws=input('Enter the stop band frequency:');
fs=input('Enter the sampling frequency:');
w1=2*wp/fs;
w2=2*ws/fs;

%LOW PASS FILTER
[n,wn]=cheb1ord(w1,w2,rp,rs);
[b,a]=cheby1(n,rp,wn);
[bz,az]=bilinear(b,a,fs);
disp('bz = ');
disp(bz);
disp('az = ');
disp(az);
Hz=tf(bz,az);
w=0:0.01:pi;
[h,om]=freqz(b,a,w);
m=20*log10(abs(h));
an=angle(h);
disp('Filter order');
disp(n);
disp('Cut-off frequency');
disp(wn);
subplot(2,1,1);
plot(om/pi,m);
ylabel('Gain in db--->');
xlabel('(a)Normalized frequency--->');
title('Low pass filter');
subplot(2,1,2);
plot(om/pi,an);
xlabel('(b)Normalized frequency--->');
ylabel('Phase in radians--->');



% BAND PASS FILTER
rp = input('Enter the passband ripple (dB): '); % Passband ripple
rs = input('Enter the stopband attenuation (dB): '); % Stopband ripple/attenuation
fp = input('Enter the passband frequency range as [f_low, f_high] (Hz): '); % Passband frequency range
fs = input('Enter the stopband frequency range as [f_low, f_high] (Hz): '); % Stopband frequency range
Fs = input('Enter the sampling frequency (Hz): '); % Sampling frequency


fp_low = fp(1);
fp_high = fp(2);
fs_low = fs(1);
fs_high = fs(2);

wp = [fp_low, fp_high] / (Fs / 2);
ws = [fs_low, fs_high] / (Fs / 2);

[n, wn] = cheb1ord(wp, ws, rp, rs);

disp('Filter order: ');
disp(n);
disp('Cut-off frequencies (normalized): ');
disp(wn);

[b, a] = cheby1(n, rp, wn);

[bz, az] = bilinear(b, a, Fs);

disp('Discrete-time filter coefficients: ');
disp('bz = ');
disp(bz);
disp('az = ');
disp(az);

Hz = tf(bz, az, 1/Fs);

w = 0:0.01:pi;
[h, om] = freqz(b, a, w);
m = 20 * log10(abs(h));
an = angle(h);

figure;
subplot(2, 1, 1);
plot(om / pi, m, 'LineWidth', 1.5);
ylabel('Gain (dB) --->');
xlabel('(a) Normalized frequency --->');
title('Bandpass Filter: Magnitude Response');
grid on;

subplot(2, 1, 2);
plot(om / pi, an, 'LineWidth', 1.5);
xlabel('(b) Normalized frequency --->');
ylabel('Phase (radians) --->');
title('Bandpass Filter: Phase Response');
grid on;

