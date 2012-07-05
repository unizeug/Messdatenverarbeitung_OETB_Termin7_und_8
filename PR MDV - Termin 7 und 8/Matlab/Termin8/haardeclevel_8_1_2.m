% Vorbereitungsaufgabe 1.2 Termin 8
function S = haardeclevel_8_1_2(x,lvl)
% function [S] = haardeclevel(x,lvl)
% ---------------------------------------------------
% filename :        haardeclevel 
% author:           Özgü Dogan, Timo Lausen, Boris Henckell 
% organisation :    TU Berlin 
% p r o j e c t :   MDV PR
% date :            04.07.2012
% ---------------------------------------------------
% description :     führt die schnelle Haartransformation 
%                   bis zu einem vorgegebenen
%                   Skalierungslevel durch
% input: x   ?      zu zerlegendes Signal
%        lvl ?      Skalierungslevel
% output: S  ?      Matrix mit Skalierungen und Details
%                   Dimensionen: lvl+1:Signallänge
%                   Jede Zeile enthält die Approximationen 
%                   gefolgt von den Details eines Levels
% ---------------------------------------------------
N = length(x);
S = ones(lvl+1,N)*-77;

S(1,:) = x;
u = x;
for i=2:lvl+1
   [u v] = haardec_8_1_1(u);
   N2 = length(u);
   S(i,:) = [u,v,S(i-1,2*N2+1:N)];
end
