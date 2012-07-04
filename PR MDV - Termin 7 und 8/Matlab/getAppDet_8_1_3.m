% Vorbereitungsaufgabe 1.3 Termin 8
function [u,v] = getAppDet_8_1_3(S, lvl )
% function [u,v] = getAppDet(S, lvl )
% ---------------------------------------------------
% filename :        getAppDet
% author:           Özgü Dogan, Timo Lausen, Boris Henckell
% organisation :    TU Berlin
% p r o j e c t :   MDV PR
% date :            04.07.2012
% ---------------------------------------------------
% description :     extrahiert die Approximationen 
%                   und details eines Levels
% input :           S   ?   Matrix mit Signalzerlegeung 
%                   lvl ?   Skalierungslevel
% output :          u   ?   Approximationen
%                   v   ?   Details
% ---------------------------------------------------
[M N] = size(S);
u = S(lvl+1,(1:N/(2^lvl)));
% v = S(lvl+1,(N/(2^lvl)+1:N));
v = S(lvl+1,(N/(2^lvl)+1:2*N/(2^lvl)));