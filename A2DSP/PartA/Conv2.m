function [Task5, impulse] = Conv2(Task1)
fprintf("Applying convolution reverb 2\n");
%Impulse Response
i = 0;
%Get user to input which reverb to be used
while (i == 0)
i = input('Add large hall (1) or small hall (2)?: ');
switch i
    case 1
        [impulse, Fs] = audioread('Largehall.wav');
    case 2
        [impulse, Fs] = audioread('SmallHall.wav');
    otherwise
        i = 0;
end
end
%Make the impulse mono
impulse(:,2) = [];  

%Normalise the impulse (same as previous but with different boundaries)
minVal = min(impulse);
maxVal = max(impulse);
minY = -0.02;
maxY = +0.02;
impulse = (maxY - minY)*(impulse - minVal)/(maxVal-minVal) + minY;

%Convolve Task1 and the impulse
Task5 = conv(Task1, impulse);

audiowrite('Task5.wav', Task5, Fs);
audiowrite('IR.wav', impulse, Fs);
fprintf("Convolution 2 applied\n");
end

