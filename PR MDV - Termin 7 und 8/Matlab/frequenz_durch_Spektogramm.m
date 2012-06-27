% Funktion zur Errechnung der Frequenzen durch das Spektogramm

function frequenz_durch_Spektogramm(x_t,t)


[S,F,T]=spectrogram(x_t,256,250,256,1E3);

%figure(201);
%plot(T);

%disp('length(x_t)');
%length(x_t)

%disp('length(T)');
%length(T)

%figure(202);
%plot(F);

%disp('length(F)');
%length(F)

%disp('length(f2)');
F2 = interp1(F,T,'spline');
F2 = F2-min(F2);
F2 = F2 * max(F)/max(F2);
%F2 = F*length(T)/length(F);
%length(F2)


%figure(203);
%plot(T,F2);



figure(204);
[AX H1 H2] = plotyy(t,x_t,T,F2,'plot','stem')
% AXIS([0 2 -1.1 1.1]);
xlabel('Zeitachse [s]');
set(get(AX(1),'Ylabel'),'String','Amplitude [V]')
set(get(AX(2),'Ylabel'),'String','Frequenz [Hz]')
title('\bf u-Signal und Frequenzanstieg über die Zeit');