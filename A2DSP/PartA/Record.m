function [Task1] = Record(Fs)       %Create a function with 1 output and 1 input
%Get user to input the amount of time to record
time = input('Enter recording time in seconds: ');
fprintf("Recording\n");             %Tell the user the program is recording

%Record at sample rate of Fs, with a bit rate of 16 using 1 channel
%with the audio recorder at ID 3
rec = audiorecorder(Fs, 16, 1, 3); 
recordblocking(rec, time);          %Record for the users input time
fprintf("Recording complete\n");    %Tell the user the program has finished recording
Task1 = getaudiodata(rec);
audiowrite('Task1.wav', Task1, Fs); %Write out the recorded audio file
end

