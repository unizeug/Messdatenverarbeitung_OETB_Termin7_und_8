% Funktion zur Errechnung der Frequenzen durch das Spektogramm

function frequenz_durch_Spektogramm(x_t)


[S,F,T]=spectrogram(x_t,256,250,256,1E3);

figure(201);
plot(T);

disp('length(T)');
length(T)

figure(202);
plot(F);

disp('length(F)');
length(F)

disp('length(f2)');
F2 = interp1(F,T);
%F2 = F*length(T)/length(F);
length(F2)


figure(203);
plot(T,F2);