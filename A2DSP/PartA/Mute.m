function [Task3] = Mute(Task3,Fs)
fprintf("Muting audio selection\n");
l = length(Task3);

%Mute the audio portion from sample number (n/2+n/100) to (n/2 + n/30)
%Answer has been rounded to get exact array positions

for i = round((l/2 + l/100)):round((l/2 + l/30))
    Task3(i) = 0;       %Make sample number equal 0 (muted)
end

audiowrite('Task3.wav', Task3, Fs);
fprintf("Audio section muted\n");
end

