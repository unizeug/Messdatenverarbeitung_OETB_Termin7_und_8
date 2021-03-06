% Funktion zur Vorbereitungsaufgabe MDV 7.1

close all; clc; clear;

t=0:0.001:2;                    % 2 secs @ 1kHz sample rate
y=chirp(t,0,2,300);              % Start @ DC, cross 150Hz at t=1sec 

N=length(t);
fs=N/max(t);

%figure(101)
%spectrogram(y,256,250,256,fs); % Display the spectrogram



%% verkleinern des overlaps
% figure(11)
% spectrogram(y,256,250,256,1E3); % Display the spectrogram
% 
% figure(12)
% spectrogram(y,256,120,256,1E3); % Display the spectrogram
% 
% figure(13)
% spectrogram(y,256,60,256,1E3); % Display the spectrogram
% 
% figure(14)
% spectrogram(y,256,30,256,1E3); % Display the spectrogram
% 
% %% verkleinern des Fensters (gleichzeit verkleinerung des Overlaps)
% 
% figure(111)
% spectrogram(y,256,250,256,1E3); % Display the spectrogram
% 
% figure(112)
% spectrogram(y,128,120,256,1E3); % Display the spectrogram
% 
% figure(113)
% spectrogram(y,64,60,256,1E3); % Display the spectrogram
% 
% figure(114)
% spectrogram(y,32,30,256,1E3); % Display the spectrogram

%% andere Formen der Kurzzeitfourietransformation
% figure(2)
% t=-2:0.001:2;                   % +/-2 secs @ 1kHz sample rate
% y=chirp(t,100,1,200,'q');       % Start @ 100Hz, cross 200Hz at t=1sec 
% spectrogram(y,128,120,128,1E3); % Display the spectrogram
%       
% figure(3)
% t= 0:0.001:1;                     % 1 second @ 1kHz sample rate
% fo=25;f1=100;                     % Start at 25Hz, go up to 100Hz
% y=chirp(t,fo,1,f1,'q',[],'convex');
% spectrogram(y,256,200,256,1000);  % Display the spectrogram.
%  
% figure(4)
% t= 0:0.001:1;                      % 1 second @ 1kHz sample rate
% fo=100;f1=25;                      % Start at 100Hz, go down to 25Hz
% y=chirp(t,fo,1,f1,'q',[],'concave');
% spectrogram(y,256,200,256,1000);   % Display the spectrogram.
%       
% figure(5)
% t= 0:0.001:10;                   % 10 seconds @ 1kHz sample rate
% fo=10;f1=400;                    % Start at 10Hz, go up to 400Hz
% y=chirp(t,fo,10,f1,'logarithmic');
% spectrogram(y,256,200,256,1000); % Display the spectrogram.

%% plotten des Signals im Zeitbereich

%frequenz_im_zeitbereich (y,t);



%frequenz_imZeitbereich_ausSignal(y,t);
%frequenz_durch_Spektogramm(y,t);

