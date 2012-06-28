function FFTshiftplot(y, T_ges, f_T, A,farbe, fignum)

% y         - Zeitvektor
% T_ges     - Dauer des Signals
% f_T       - Abtastfrequenz
% A         - Amplitude
% farbe     - Farbe des Graphen
% fignum    - Nummer der figure


% Zeropadding Faktor
zpf = 1;

temp = zeros(length(y)*zpf,1);
temp(1:length(y)) = y;
 
y = temp;

T_ges = T_ges * zpf;



%Berechnung des Spektrums
y_DFT = fftshift(fft(y));
%y_DFT = fftshift(y_DFT);
N = length(y);
%Betragsspektrum
%y_DFT_abs = 10*LOG10(abs(y_DFT)/N);
y_DFT_abs = abs(y_DFT)/N;
%Phasenspektrum
y_DFT_phase = unwrap(angle(y_DFT))/N;
%Zeitachse
t = T_ges*(0:(N-1))/(N-1);
%Frequenzachse
f_DFT = f_T/(N-1)*((-N/2):(N/2-1));
%neues Fenster zur Darstellung
figure(fignum);
%Darstellung des Zeitsignals
subplot(3,1,1);
plot(t,y,farbe);
AXIS([0 T_ges/zpf min(y)*1.21 max(y)*1.2])
title('Zeitsignal');
xlabel('t/s');
ylabel('u/V');
%Darstellung des Amplitudenspektrums
subplot(3,1,2);
STEM(f_DFT, y_DFT_abs,'.-');
AXIS([-12000 12000 0 max(y_DFT_abs)*1.2]);
%xlim ([-500 500])
title('Amplitudenspektrum');
xlabel('f/Hz');
ylabel('A(f)[dB]');    
%Darstellung des Phasenspektrums
subplot(3,1,3);
plot(f_DFT, y_DFT_phase);
%AXIS([0 4E3 0 0.4E-5])
title('Phasenspektrum');
xlabel('f/Hz');
ylabel('phi(f)');