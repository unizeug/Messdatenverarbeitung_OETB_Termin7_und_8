%MDV Praktikum 7 Vorbereitungsaufgabe 4

function y_DFT_abs = MotorStrom_Amplitudenspektrum (y, T_ges, f_T, A,farbe, fignum)

% y - Stromvektor
% T_ges -Dauer des Signals
% f_T - Abtastfrequenz
% A - Versorgungsspannung
% fignum - Nummer der figure


%Berechnung des Spektrums
y_DFT = fftshift(fft(y));
N = length(y);
%Betragsspektrum
% y_DFT_abs = 10*LOG10(abs(y_DFT)/N);
y_DFT_abs = (abs(y_DFT)/N);
%Phasenspektrum
y_DFT_phase = unwrap(angle(y_DFT)/N);
%Zeitachse
t = T_ges*(0:(N-1))/(N-1);
%Frequenzachse
f_DFT = f_T/(N-1)*((-N/2+0.5):(N/2-0.5));
%neues Fenster zur Darstellung
figure(fignum);
%Darstellung des Zeitsignals
subplot(3,1,1);
plot(t,y,farbe);
% AXIS([-1500 1500 -100 150]);
xlim([0 1*10^-5]);
title('Zeitsignal');
xlabel('t [s]');
ylabel('u [V]');
%Darstellung des Amplitudenspektrums
subplot(3,1,2);
stem(f_DFT, y_DFT_abs,'.-');
AXIS([-1500 1500 0 max(y_DFT_abs)*1.2]);
% ylim ([-30 5])
title('Amplitudenspektrum');
xlabel('f [Hz]');
ylabel('A(f)[V]');    
%Darstellung des Phasenspektrums
subplot(3,1,3);
plot(f_DFT, y_DFT_phase);
%AXIS([-4000 4000 -1E-6 1E-6])%simuliert
%AXIS([-4000 4000 -4E-5 4E-5]);%gemessen
title('Phasenspektrum');
xlabel('f [Hz]');
ylabel('phi(f)');
end