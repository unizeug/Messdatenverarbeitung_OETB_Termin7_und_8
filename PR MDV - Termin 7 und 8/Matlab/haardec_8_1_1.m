% Vorbereitungsaufgabe 1.1 Termin 8
function [u,v] = haardec_8_1_1(x)
% function [u,v] = haardec(x)
% ---------------------------------------------------
% filename :        haardec
% author:           Özgü Dogan, Timo Lausen, Boris Henckell
% organisation :    TU Berlin
% p r o j e c t :   MDV PR
% date :            04.07.2012
% ---------------------------------------------------
% description :     führt einen Zerlegungsschritt
%                   der schnellen Haartransformation durch
% input :           x ? zu zerlegendes Signal
% output :          u ? Approximationen
%                   v ? Details
% ---------------------------------------------------

N = length(x);
u = ones(1,N/2)*-99;
v = ones(1,N/2)*-88;
j=1;
for i=1:N/2
   u(i) = (x(j)+x(j+1))/sqrt(2);
   v(i) = (x(j)-x(j+1))/sqrt(2);
   j=j+2;
end

% u
% length(u)
% v
% length(v)


