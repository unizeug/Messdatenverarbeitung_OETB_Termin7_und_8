%Hauptprogramm um function zu testen

t = 0:0.001:2;
u = chirp(t,0,1,100);

figure(1);
plot(u)
xlabel('Zeitachse [ms]');
ylabel('Amplitude [V]');
title('\bf Chirp-Signal über der Zeit');
AXIS([0 2000 -1.2 1.2]);

figure(2);
spectrogram(u,256,250,256,1E3)
title('\bf Spektrogramm des Chirp-Signals');
figure(3);
spectrogram(u,256,250,100,1E3)      %kleinere Überlappung zw Segmenten
title('\bf Spektrogramm mit kleinerer Überlappungsläche');
figure(4);
spectrogram(u,500,250,256,1E3)      %größeres Fenter
title('\bf Spektrogramm mit größerem Fenster');


% frequenz_imZeitbereich_ausSignal(u,t)
% frequenz_durch_Spektogramm(u,t)