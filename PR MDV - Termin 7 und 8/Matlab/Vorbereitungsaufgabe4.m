%MDV Praktikum 7 Vorbereitungsaufgabe 4 - Testprogramm

clear all; clc;

%Messwerte laden
messung1 = load('MotorStrom_10V_100kS.mat');
messung2 = load('MotorStrom_20V_100kS.mat');
messung3 = load('MotorStrom_30V_100kS.mat');

%Ströme und Tachos identifizieren
strom1 = messung1.strom;
tacho1 = messung1.tacho;
strom2 = messung2.strom;
tacho2 = messung2.tacho;
strom3 = messung3.strom;
tacho3 = messung3.tacho;

%Versorgungsspannungen
A1 = 10;
A2 = 20;
A3 = 30;

f_T = 100000;
T_ges = 1/f_T;

<<<<<<< HEAD
MotorStrom_Amplitudenspektrum(strom1,T_ges,f_T,10,'b',1)
% MotorStrom_Amplitudenspektrum(strom2,T_ges,f_T,10,'b',2)
% MotorStrom_Amplitudenspektrum(strom1,T_ges,f_T,10,'b',3)
=======
MotorStrom_Amplitudenspektrum(strom1,T_ges,f_T,10,'b',1);
MotorStrom_Amplitudenspektrum(strom2,T_ges,f_T,10,'b',2);
MotorStrom_Amplitudenspektrum(strom1,T_ges,f_T,10,'b',3);
>>>>>>> branch 'master' of https://github.com/unizeug/Messdatenverarbeitung_OETB_Termin7_und_8.git
