%MDV Praktikum 8 Vorbereitungsaufgabe 3
%Daubechies-Wavelets

%Signal laden
x = load('strom.mat');
x = x.x;

%Skalierungslevel variabel, hier 5
N = 5;

%mittels wavedec: Daubechies-Wavelet ('db1'-wavename) 
% C      = [app. coef.(N)|det. coef.(N)|... |det. coef.(1)]
% L(1)   = length of app. coef.(N)
% L(i)   = length of det. coef.(N-i+2) for i = 2,...,N+1
% L(N+2) = length(X)
[C,L] = wavedec(x,N,'db1');

%mittel appcoef: Berechnung der App.Koeffizienten in Level N
%gibt Vektor approx der L�nge L(1) mit den Koeffizienten aus
approx = appcoef(C,L,'db1',N);

%mittels detcoef: Berechnung der Det.Koefizienten in Level N
%gibt Vektor details der L�nge L(1) mit den Koeffizienten aus
%braucht keine Wavelet-Vorgabe mehr, nur Ergebnisse aus wavedec
details = detcoef(C,L,N);

%Wie kann an die Anzahl der verschwindenden Momente im Wavelet variieren?+
%entweder �ber db1, db4 und db15 oder �ber die Ordnung N