clear all;
clc;
Fs = 44100;

a = 0;
while (a == 0)
a = input('Record audio (1) or use pre-recorded sample (2): ');
switch a
    case 1
        Task1 = Record(Fs);
    case 2
        Task1 = GetAudio;
    otherwise
        a = 0;
end
end
T1 = audioplayer(Task1,Fs);

Task2 = Normalise(Task1,Fs);
T2 = audioplayer(Task2,Fs);

Task3 = Mute(Task1,Fs);
T3 = audioplayer(Task3,Fs);

Task4 = Conv1(Task1,Fs);
T4 = audioplayer(Task4,Fs);

[Task5, impulse] = Conv2(Task1);
T5 = audioplayer(Task5,Fs);

a = 0;
fprintf('-----------------------------\n');
fprintf('Task playback, enter the number in brackets or enter 0 to exit\n');

while (a == 0)
i = input('Task 1 (1)\nTask 2 (2)\nTask 3 (3)\nTask 4 (4)\nTask 5 (5)\n');
switch i
    case 1
        Playback(T1);
    case 2
        Playback(T2);
    case 3
        Playback(T3);
    case 4
        Playback(T4);
    case 5
        Playback(T5);
    otherwise
        a = 1;
end
end
