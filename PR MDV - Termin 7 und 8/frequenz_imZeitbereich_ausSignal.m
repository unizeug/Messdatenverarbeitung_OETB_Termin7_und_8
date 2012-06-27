%Funktion zum Errechnen der Frequenz aus dem Zeitsignal

function frequenz_imZeitbereich_ausSignal (u, t)

p = length(t);
q = max(t)/p;

i = 0;
for k = 1:1:length(u)-1     %i = Anzahl der Nulldurchgänge
    if (u(k) < 0 && u(k+1) >=0) || (u(k) > 0 && u(k+1) <=0)
        i = i+1;
    end
end                         

nulldurchgang = ones(1,i)*-9;     %Vektor der Länge i

j = 1;
for indx = 1:1:length(u)-1
    if (u(indx) < 0 && u(indx+1) >=0) || (u(indx) > 0 && u(indx+1) <=0)
        if abs(u(indx)) > abs(u(indx+1))
            nulldurchgang(j) = indx+1;   
        else
            nulldurchgang(j) = indx;        %Index, welcher am nächsten am Nulldurchgang ist, wird übernommen
        end
        j = j+1;
    end
end

%Vektor für Frequenzeinträge
v = length(nulldurchgang);
frequenzen = ones(1,v)*-9;

for n = 1:1:v-4                 %4 Nulldurchgänge, also 2 Perioden werden betrachtet
    diff = nulldurchgang(n+4)-nulldurchgang(n);
    frequenzen(n) = 1/(diff*0.5*q);
end

figure(1);
[AX H1 H2] = plotyy(t,u,nulldurchgang*(2/p),frequenzen,'plot','stem')
AXIS([0 2 -1.1 1.1]);
xlabel('Zeitachse [s]');
set(get(AX(1),'Ylabel'),'String','Amplitude [V]')
set(get(AX(2),'Ylabel'),'String','Frequenz [Hz]')
title('\bf u-Signal und Frequenzanstieg über die Zeit');
