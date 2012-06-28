% Funktion zur Errechnung der Frequenzen durch das Spektogramm

function frequenz_durch_Spektogramm(x_t,t)


N=length(t);
fs=N/max(t);

wnsize=256;
wnoverlap= 250;
nr_abtastwerte_frequenz= 256;

[S,F,T]=spectrogram(x_t,wnsize,wnoverlap,nr_abtastwerte_frequenz,fs);

%spectrogram(x_t,wnsize,wnoverlap,nr_abtastwerte_frequenz,fs);

groesse = size(S);
maxfrequ = ones(1,groesse(1))*-9;
maxfrequ_umgerechnet = ones(1,groesse(1))*-9;
maxindx = ones(1,groesse(1))*-8;
maxindx_umgerechnet = ones(1,groesse(1))*-8;

for i=1:groesse(2)
   [maxfrequ(i) maxindx(i)] = max(abs(S(:,i)));
   maxfrequ_umgerechnet(i) = F(round(maxindx(i)+1));
   maxindx_umgerechnet(i) = T(round(i));
end

maxindx_umgerechnet

figure(204);
[AX H1 H2] = plotyy(t,x_t,maxindx_umgerechnet,maxfrequ_umgerechnet,'plot','stem');
% AXIS([0 2 -1.1 1.1]);
xlabel('Zeitachse [s]');
set(get(AX(1),'Ylabel'),'String','Amplitude [V]');
set(get(AX(2),'Ylabel'),'String','Frequenz [Hz]');
title('\bf u-Signal und Frequenzanstieg über die Zeit');