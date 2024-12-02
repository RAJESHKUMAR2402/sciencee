clc;
clear all;

% Fast fourier transform
disp('Fast fourier transform');
l=input('enter the length ');
x=input('enter the input sequence');
y=fft(x,l);
disp('resultant FFT sequence');y
subplot(2,2,1);
stem(x);
title('input');xlabel('n-?'); ylabel('x(n)');
subplot(2,2,2);
stem(y);
title('FFT sequence'); xlabel('frequency'); ylabel('X(k)');

%Inverse Fast fourier transform
disp('inverse fast fourier transform');
x1=input('enter the FFT sequence');
y1=ifft(x1);
disp('resultant IFFT sequence');y1
subplot(2,2,3);
stem(x1);
title('FFT sequence'); xlabel('frequency'); ylabel('X(k)');
subplot(2,2,4);
stem(y1);
title('IFFT sequence'); xlabel('n--?'); ylabel('x(n)');
figure(2);
freqz(y);
title('fft sequence');
figure(3);
freqz(y1);
title('ifft sequence');

%input
%Length of the sequence = 4
%Input Sequence for FFT= [1, 2, 3, 4]
%FFT Output Sequence = [10,-2 + 2i,  -2, 2 - 2i]
%Input Sequence for IFFT =[10,-2 + 2i, -2, 2 - 2i]
%IFFT Output Sequence = [1,2,3,4]
