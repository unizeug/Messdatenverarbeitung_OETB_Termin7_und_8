%MDV Praktikum 8 Vorbereitungsaufgabe 3
%Daubechies-Wavelets
%Bemerkung: Anzahl der verschwindenden Momenten variierbar durch
%db1,db4,db15


function [approx details] = Daubechies_Wavelets(x,lvl, db)

%Skalierungslevel variabel
N = lvl;

%mittels wavedec: Daubechies-Wavelet ('db1'-wavename) 
% C      = [app. coef.(N)|det. coef.(N)|... |det. coef.(1)]
% L(1)   = length of app. coef.(N)
% L(i)   = length of det. coef.(N-i+2) for i = 2,...,N+1
% L(N+2) = length(X)
[C,L] = wavedec(x,N,db);

%mittel appcoef: Berechnung der App.Koeffizienten in Level N
%gibt Vektor approx der L�nge L(1) mit den Koeffizienten aus
approx = appcoef(C,L,db,N);

%mittels detcoef: Berechnung der Det.Koefizienten in Level N
%gibt Vektor details der L�nge L(1) mit den Koeffizienten aus
%braucht keine Wavelet-Vorgabe mehr, nur Ergebnisse aus wavedec
details = detcoef(C,L,N);