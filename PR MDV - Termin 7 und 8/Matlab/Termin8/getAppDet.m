%MDV Praktikum 8 Vorbereitungsaufgabe 1
%Funktion getAppDet

function [u, v] = getAppDet(S,lvl)

% extrahiert die Approximaionen und Details eines Levels
% input :       S - Matrix mit Signalzerlegung
%             lvl - Skalierungslevel
% output :      u - Aproximationen
%               v - Details
% Bemerkung :   Jede Zeile in S enth�lt die Approximationen gefolgt von den
%               Details eines Levels
%               Skalierungslevel ist eine Potenz von zwei = ganzzahlig

m = length(S(lvl,:));       %gibt L�nge der lvl. Zeile wieder

u = S(lvl,(1:m/2));         %1.H�lfte der Eintr�ge = u
v = S(lvl,((m/2)+1:m));     %2.H�lfte der Eintr�ge = v 

disp(['Approximationen u im gew�hlten Level ',num2str(lvl)  ' : ',num2str(u)]);
disp(['Details v im gew�hlten Level ',num2str(lvl) ' : ',num2str(v)]);

end


