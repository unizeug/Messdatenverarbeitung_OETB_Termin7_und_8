%MDV Praktikum 8 Vorbereitungsaufgabe 1
%Funktion haardeclevel

function [S] = haardeclevel(x, lvl)

% führt die Schnelle Haar-Transformation bis zu einem  
% vorgegebenen Sakalierungslevel durch
% input :       x - zu zerlegendes Signal
%             lvl - Skalierungslevel
% output :      S - Matrix mit Skalierungen und Details
%                   Dimensionen: lvl+1:Signallänge
% Bemerkung :   Jede Zeile enthält die Approximationen gefolgt von den
%               Details eines Levels
%               Skalierungslevel ist eine Potenz von zwei = ganzzahlig

n1 = length(x);
S = ones(lvl+1, n1)*-4;          %Hat lvl+1 Zeilen und n Spalten
u = x;

S(1,:) = x;                     %erste Zeile ist das Originalsignal     

for i=2:(lvl+1)
    [u, v] = haardec(u)
    n2 = length(u);
    S(lvl,:) = [u, v, S(i-1,((2*n2)+1):n1)];
end

