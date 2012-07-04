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

n = length(x);
S = ones(lvl+1, n);              %Hat lvl+1 Zeilen und n Spalten

i = 1;
for i:1:lvl
    [u, v] = haardec(x);
    S(i) = [haardeclevel(u), v]
end

