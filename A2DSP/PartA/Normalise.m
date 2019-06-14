function [Task2] = Normalise(Task1,Fs)
fprintf("Normalising audio\n");
minVal = min(Task1);    %Get the minimun value of the audio data
maxVal = max(Task1);    %Get the maximum value of the audio data
minY = -1;              %Set the minimum value to be normalised to
maxY = +1;              %Set the maximum value to be normalised to

%Normalise the audio to the set boundaries
Task2 = (maxY - minY)*(Task1 - minVal)/(maxVal-minVal) + minY;

T = 1/Fs;               %Define the peroid of the sample
L = length(Task1);      %Define length of the sample
t = (0:L-1)*T;          %Define time in seconds of sample

L2 = length(Task2);  	%Define length of the normalised sample
t2 = (0:L2-1)*T;        %Define time in seconds of normalised sample

%Plot original audio and normalised audio
subplot(2,1,1)
plot(t,Task1);
title('Original Audio');
xlabel('Time (S)') 
ylabel('Amplitude') 
subplot(2,1,2)
plot(t2,Task2);
title('Normalised Audio');
xlabel('Time (S)') 
ylabel('Amplitude') 

audiowrite('Task2.wav', Task2, Fs);
fprintf("Audio has been normalised\n");
end

