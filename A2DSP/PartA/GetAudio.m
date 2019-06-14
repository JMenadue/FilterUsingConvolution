function [Task1] = GetAudio()
fprintf("Getting audio data (60 second sample)\n");

%Create 2 new arrays based upon the reading of the sample
[Task1, Fs] = audioread('audiosample.wav'); 
audiowrite('Task1.wav', Task1, Fs); %Write out the audio file
fprintf("Audio data received\n");
end

