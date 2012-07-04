% Vorbereitungsaufgaben 8

close all; clc, clear;

load('strom');
% [u1 v1] = haardec_8_1(x);
% [u2 v2] = haardec_8_1(u1);
% [u3 v3] = haardec_8_1(u2);
% [u4 v4] = haardec_8_1(u3);
% [u5 v5] = haardec_8_1(u4);

S = haardeclevel_8_1_2(x,5);
% size(S)
[u v] = getAppDet_8_1_3(S, 5);
% u
% v

figure(801);
hold on
    plot(x)
    plot(u,'r')
    plot(v,'c')
hold off
% figure(802)
% plot(u)
% 
% figure(803)
% plot(v)