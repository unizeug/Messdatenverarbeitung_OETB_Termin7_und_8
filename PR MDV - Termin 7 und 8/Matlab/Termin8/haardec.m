%MDV Praktikum 8 Vorbereitungsaufgabe 1
%Funktion haardec

function [u, v] = haardec(x)

% führt einen Zerlegungsschritt der schnellen Haartransformation durch
% input :       x ? zu zerlegendes Signal
% output :      u ? Approximationen
%               v ? Details
% Bemerkung :   u,v sind halb so lang wie x


%Haar-Matrix sieht wie folgt aus:
% haar_matrix = ones(2,2);
% haar_matrix(4) = -1;
% haar_matrix = haar_matrix*(1/sqrt(2));

n = length(x);               %Länge des Eingangssignals
                        
u_u = x(1:2:n-1);            %ungerade Komponenten des Signals
u_g = x(2:2:n);              %gerade Komponenten des Signals

u = (u_u + u_g)/sqrt(2);     %Approximationen
v = (u_u - u_g)/sqrt(2);     %Details

% plot(x)
% hold on
% plot(u, 'r')
% hold on
% plot(v, 'g')
% hold off

end
