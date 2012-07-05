% Vorbereitungsaufgabe 1 Termin 8
function [u,v] = haardec(x)
% function [u,v] = haardec(x)
% ---------------------------------------------------
% filename : haardec
% author: Özgü Dogan, Timo Lausen, Boris Henckell
% organisation : TU Berlin
% p r o j e c t : MDV PR
% date : Tag der Implementierung
% ---------------------------------------------------
% description : führt einen Zerlegungsschritt
%               der schnellen Haartransformation durch
% input :   x ? zu zerlegendes Signal
% output :  u ? Approximationen
%           v ? Details
% ---------------------------------------------------

ergebnis = ones(1,length(x)/2)*-99;
j=1;
for i=1:x/2
   ergebnis(i) = x(j)-x(j+1)
   j=j+2;
end
u=0;
v=0;
