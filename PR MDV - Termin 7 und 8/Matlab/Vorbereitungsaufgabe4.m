%MDV Praktikum 7 Vorbereitungsaufgabe 4 - Testprogramm

clear all; clc; close all;

%Messwerte laden
messung1 = load('MotorStrom_10V_100kS.mat');
messung2 = load('MotorStrom_20V_100kS.mat');
messung3 = load('MotorStrom_30V_100kS.mat');

%Str�me und Tachos identifizieren
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

[y_DFT_abs_10V f_DFT_10V]= MotorStrom_Amplitudenspektrum(strom1,T_ges,f_T,10,'b',1);
[y_DFT_abs_20V f_DFT_20V]= MotorStrom_Amplitudenspektrum(strom2,T_ges,f_T,10,'b',2);
[y_DFT_abs_30V f_DFT_30V]= MotorStrom_Amplitudenspektrum(strom3,T_ges,f_T,10,'b',3);

[maxwert10 maxind10] = max(y_DFT_abs_10V);
[maxwert20 maxind20] = max(y_DFT_abs_20V);
[maxwert30 maxind30] = max(y_DFT_abs_30V);

Drehzahl_Motor_10V = abs(f_DFT_10V(maxind10))/18
Drehzahl_Motor_20V = abs(f_DFT_20V(maxind20))/18
Drehzahl_Motor_30V = abs(f_DFT_30V(maxind30))/18


[y_DFT_abs_10V f_DFT_10V]= MotorStrom_Amplitudenspektrum(strom1,T_ges,f_T,10,'b',1);