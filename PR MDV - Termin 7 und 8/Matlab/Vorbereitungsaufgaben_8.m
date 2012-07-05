% Vorbereitungsaufgaben 8

close all; clc, clear;

load('strom');

S = haardeclevel_8_1_2(x,5);

fignum=801;
for lvl=1:5
    [u v] = getAppDet_8_1_3(S, lvl);
    N=length(u);
    u2=ones(1,N*2^lvl);
    v2=ones(1,N*2^lvl);
    j=1;
%     Die Approximation und die Details auf die Länge von x normieren
    for i=1:N
        for k=1:2^lvl
            u2(j) = u(i);
            v2(j) = v(i);
            j = j+1;
        end
    end

%     figure(fignum);
%     hold on
%         plot(x)
%         plot(u2,'r')
%         plot(v2,'c')
%     hold off

    fignum= fignum+1;
    
end

wn = ones(1,length(x));
fs = 1;
% Achtung funktioniert noch nicht wirklich
Spektrum(x, wn, fs, 1,'b',-10,10,-100,30, fignum)