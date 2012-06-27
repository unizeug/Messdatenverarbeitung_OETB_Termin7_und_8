%Hauptprogramm um function zu testen

t = 0:0.001:8;
u = chirp(t,0,1,100);

frequenz_imZeitbereich_ausSignal(u,t)
figure(2);
spectrogram(u,256,250,256,1E3)