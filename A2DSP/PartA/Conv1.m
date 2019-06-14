function [Task4] = Conv1(Task1,Fs)
fprintf("Applying convolution reverb 1\n");
%Conv Rev
T = 1/Fs; %Define the peroid of the audio
%Define each sample number
D1 = 0.22/T; 
D2 = 0.45/T;
D3 = 0.6/T;
D4 = 0.8/T;
D5 = 1/T;
D6 = 1.2/T;
%Set the array t to equal an amplitude at each sample number
t(D1) = 0.6;
t(D2) = 0.4;
t(D3) = 0.15;
t(D4) = 0.08;
t(D5) = 0.05;
t(D6) = 0.03;

Task4 = conv(Task1,t);
audiowrite('Task4.wav', Task4, Fs);
fprintf("Convolution 1 applied\n");
end

