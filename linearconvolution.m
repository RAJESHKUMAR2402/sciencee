clc;
x=input('enter 1st seq');
h=input('enter 2nd seq');
y=conv(x,h);
figure;
subplot(3,1,1);
stem(x);
ylabel('amplitude');
xlabel('a n--->');
subplot(3,1,2);
stem(h);
ylabel('amplitude');
xlabel('b n--->');
subplot(3,1,3);
stem(y);
ylabel('amplitude');
xlabel('c n--->');
disp('the result is');

%input
%enter 1st seq [5 6 7 8]
%enter 2nd seq [8 7 6 5]
%the result is
% y =    40    83   128   174   128    83    40
