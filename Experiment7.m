% Explanation and implementation Discrete Fourier Transform(DFT) and Inverse 
%Discrete Fourier Transform(IDFT) using MATLAB.
clc 
clear all 
close all 
Fa=input('Enter a frequency Fa : '); 
Fs=input('Enter a frequency Fs : '); 
T=1/Fa; 
t=0:T/99:T; 
y=5*sin(2*pi*Fa*t) +2*sin(2*pi*2*Fa*t)+2*sin(2*pi*3*Fa*t); 
figure(1) 
plot(t,y); 
Ts=1/Fs; 
N=T/Ts; 
n=0:N-1; 
yy=5*sin(2*pi*Fa*n*Ts)+ 2*sin(2*pi*2*Fa*n*Ts)+ 2*sin(2*pi*3*Fa*n*Ts); 
figure(2) 
stem(n,yy) 
h=[]; 
b=[]; 
for(k=1:1:N) 
for (n=1:1:N) 
ff=yy(n)*exp(-j*2*pi*(k-1-(N/2))*(n-1-(N/2))/N); 
h=[ h ff]; 
end 
p=sum(h); 
b=[b p]; 
h=0; 
end 
figure(3) 
f=Fs*(-N/2:(N/2)-1)/N; 
stem(f,abs(b)); 
axis([ -30 30 0 160]); 
%IDFT of a sequence 
Xk=input('Enter X(K)='); 
[N,M]=size(Xk); 
if M~=1; 
Xk=Xk.'; 
N=M; 
end; 
xn=zeros(N,1); 
k=0:N-1; 
for n=0:N-1; 
xn(n+1)=exp(j*2*pi*k*n/N)*Xk; 
end; 
xn=xn/N; 
disp('x(n)='); 
disp(xn); 
plot(xn); 
grid on; 
plot(xn); 
stem(k,xn); 
xlabel('....>n'); 
ylabel('........>Magnitude'); 
title('IDEF OF A SEQUENCE');