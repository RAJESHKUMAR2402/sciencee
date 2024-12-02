clear all;
clc;
disp('design of fir low pass filter using window function');
n=input('enter number of sample=');
w=input('enter the cut of frequency=');
n=n-1;



  %Low Pass Filter
disp('LPF using Hanning window');
lpf=fir1(n,w/pi,hann(n+1));
[h,w1]=freqz(lpf,1,256);
m=20*log(abs(h));
subplot(2,2,1);
plot(w1/pi,m);
ylabel('gain in dB');
xlabel('normalized freq');
title('low pass filter');
title('LPF using Hanning window');
  %High Pass Filter
disp('HPF using Hanning window');
hpf=fir1(n,w/pi,'high',hann(n+1));
[h1,w2]=freqz(hpf,1,256);
m1=20*log(abs(h1));
subplot(2,2,2);
plot(w2/pi,m1);
ylabel('gain in dB');
xlabel('normalized freq');
title('High pass filter');
title('HPF using Hanning window');
%Band Pass Filter
wc1=input('enter the first cut of frequency=');
wc2=input ('enter the second cut of frequency=');
wn=[wc1 wc2];
disp ('BPF using Hanning window');
bpf=fir1(n,wn/pi,'bandpass',hann(n+1));
[h2,w3]=freqz(bpf,1,256);
m2=20*log(abs(h2));
subplot(2,2,3);
plot(w3/pi,m2);
ylabel('gain in dB');
xlabel('normalized freq');
title('Band pass filter');
title('BPF using Hanning window');
%Band Stop Filter
wc3=input('enter the first cut of frequency=');
wc4=input('enter the  second cut of frequency=');
wn1=[wc3 wc4];
disp('BSF using Hanning window');
bsf=fir1(n,wn1/pi,'stop',hann(n+1));
[h3,w4]=freqz(bsf,1,256);
m3=20*log(abs(h3));
subplot(2,2,4);
plot(w4/pi,m3);
ylabel('gain in dB');
xlabel('normalized freq');
title('Stop pass filter');title('BSF using Hanning window');
%input
᠀%design of fir low pass filter using window function
%enter number of sample=7
%enter the cut of frequency=0.5
5LPF using Hanning window
5HPF using Hanning window
5enter the first cut of frequency=1
5enter the second cut of frequency=1.2
5BPF using Hanning window
5enter the first cut of frequency=1
5enter the  second cut of frequency=1.2
