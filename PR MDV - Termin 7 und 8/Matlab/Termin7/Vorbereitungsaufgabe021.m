%MDV PR07 Vorbereitungsaufgabe 021
clear;

%Tipp von Sven, über die Nulldurchgänge gehen, nicht Maxima suchen

t = 0:0.001:2;

chirp = chirp(t,0,1,100);       %selbes Signal wie in Aufgabe 1

i = 0;
for k = 1:1:length(chirp)-1     %i = Anzahl der Nulldurchgänge
    if (chirp(k) < 0 && chirp(k+1) >=0) || (chirp(k) > 0 && chirp(k+1) <=0)
        i = i+1;
%         nulldurchgang = [nulldurchgang; k]
    end
end                         

nulldurchgang = ones(1,i)*-9;     %Vektor der Länge i

j = 1;

for indx = 1:1:length(chirp)-1
    if (chirp(indx) < 0 && chirp(indx+1) >=0) || (chirp(indx) > 0 && chirp(indx+1) <=0)
        nulldurchgang(j) = indx;   %beinhaltet die Indizes der Nulldurchgänge
        j = j+1;
    end
end

%jeder dritte Nulldurchgang ist eine Periode
%Delta t zwischen jedem 3.Nulldurchgang bildet im Kehrwert die Frequenz
%ein Index steht für 0.001s

plot(chirp)
hold on
stem(nulldurchgang, zeros(1,length(nulldurchgang)),'r')
hold off

for n = 1:2: