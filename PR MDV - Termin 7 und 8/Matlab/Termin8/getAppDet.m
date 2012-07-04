%MDV Praktikum 8 Vorbereitungsaufgabe 1
%Funktion getAppDet

function [u, v] = getAppDet(S,lvl)

% extrahiert die Approximaionen und Details eines Levels
% input :       S - Matrix mit Signalzerlegung
%             lvl - Skalierungslevel
% output :      u - Aproximationen
%               v - Details
% Bemerkung :   Jede Zeile in S enthält die Approximationen gefolgt von den
%               Details eines Levels
%               Skalierungslevel ist eine Potenz von zwei = ganzzahlig >0

m = length(S(lvl,:));       %gibt Länge der lvl. Zeile wieder


    u = S((lvl+1) , (1:m/(2^lvl)));
    v = S((lvl+1) , ((m/(2^lvl))+1):(m/(2^lvl))*2);   
    
%   v = S((lvl+1) , (m/(2^lvl))+1:m)                  %Details aus der gesamten Zeile                                                      der Zeile

    
% disp(['Approximationen u im gewählten Level ',num2str(lvl)  ' : ',num2str(u)]);
% disp(['Details v im gewählten Level ',num2str(lvl) ' : ',num2str(v)]);

end


