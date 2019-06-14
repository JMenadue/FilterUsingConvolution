%Clear the command window and workspace
clear all;
clc;

%Create 2 new arrays based upon the reading of the sample
[data, fs] = audioread('Audio.wav');

T = 1/fs;           %Define the peroid of the sample
L = length(data);   %Define length of the sample
t = (0:L-1)*T;      %Define time in seconds of sample

%Create filter
order=128;
cutoff = 2000/fs/2;
H = fir1(order, cutoff);
Lf = length(H);
t2 = (0:Lf-1)*T;    %Define time in seconds of filter

%filter the original sample using convolution
filt = conv(data, H);

L2 = length(filt);  %Define length of the filtered sample
t3 = (0:L2-1)*T;

%--------------------------------FFT-----------------------------------%

y = fft(data);      %Get the fast fourier transform of the sample
yf = fft(H);        %Get the fast fourier transform of the filter
yH = fft(filt);     %Get the fast fourier transform of the filtered sample

%Get one side of the real values of FFT results from the sample
P2=abs(y/L);
P1=P2(1:round(L/2+1));
P1(2:end-1)=2*P1(2:end-1);

%Define frequency domain
ff = fs*(0:round(L/2))/L;

%Get one side of the real values of FFT results from the filter
P2f=abs(yf/Lf);
P1f=P2f(1:round(Lf/2+1));
P1f(2:end-1)=2*P1f(2:end-1);

%Define frequency domain
fff = fs*(0:round(Lf/2))/Lf;

%Get one side of the real values of FFT results from the filtered sample
P2H=abs(yH/L2);
P1H=P2H(1:round(L2/2+1));
P1H(2:end-1)=2*P1H(2:end-1);

%Define the frequency domain
ffH = fs*(0:round(L2/2))/L2;

%---------------------------PLOT GRAPHS--------------------------------%
subplot(3,2,1);
plot(t,data);
title('Sample');
xlabel('Time (S)') 
ylabel('Amplitude') 

subplot(3,2,3);
stem(t2,H);
title('Filter');
xlabel('Time (S)') 
ylabel('Amplitude') 

subplot(3,2,5);
plot(t3,filt);
title('Filtered Sample');
xlabel('Time (S)') 
ylabel('Amplitude') 

%Plot the non-normalised FFT results
subplot(3,2,2);
plot(ff, P1);
title('Frequency domain of sample')
xlabel('Frequency (Hz)') 
ylabel('Amplitude') 

%Plot the non-normalised FFT results
subplot(3,2,4);
plot(fff, P1f);
title('Frequency domain of filter')
xlabel('Frequency (Hz)') 
ylabel('Amplitude') 

%Plot the non-normalised FFT results
subplot(3,2,6);
plot(ffH, P1H);
title('Frequency domain of Filtered Sample')
xlabel('Frequency (Hz)') 
ylabel('Amplitude') 


audiowrite('FilteredAudio.wav', filt, fs);
