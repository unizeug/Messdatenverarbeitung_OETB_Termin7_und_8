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

[y_DFT_abs_10V_strom f_DFT_10V_strom]= MotorStrom_Amplitudenspektrum(strom1,T_ges,f_T,10,'b',1);
[y_DFT_abs_20V_strom f_DFT_20V_strom]= MotorStrom_Amplitudenspektrum(strom2,T_ges,f_T,10,'b',2);
[y_DFT_abs_30V_strom f_DFT_30V_strom]= MotorStrom_Amplitudenspektrum(strom3,T_ges,f_T,10,'b',3);

[maxwert10_strom maxind10_strom] = max(y_DFT_abs_10V_strom);
[maxwert20_strom maxind20_strom] = max(y_DFT_abs_20V_strom);
[maxwert30_strom maxind30_strom] = max(y_DFT_abs_30V_strom);

Drehzahl_Motor_10V_strom = abs(f_DFT_10V_strom(maxind10_strom))/18
Drehzahl_Motor_20V_strom = abs(f_DFT_20V_strom(maxind20_strom))/18
Drehzahl_Motor_30V_strom = abs(f_DFT_30V_strom(maxind30_strom))/18


[y_DFT_abs_10V_tacho f_DFT_10V_tacho]= MotorStrom_Amplitudenspektrum(tacho1,T_ges,f_T,10,'b',4);
[y_DFT_abs_20V_tacho f_DFT_20V_tacho]= MotorStrom_Amplitudenspektrum(tacho2,T_ges,f_T,10,'b',5);
[y_DFT_abs_30V_tacho f_DFT_30V_tacho]= MotorStrom_Amplitudenspektrum(tacho3,T_ges,f_T,10,'b',6);

[maxwert10_tacho maxind10_tacho] = max(y_DFT_abs_10V_tacho);
[maxwert20_tacho maxind20_tacho] = max(y_DFT_abs_20V_tacho);
[maxwert30_tacho maxind30_tacho] = max(y_DFT_abs_30V_tacho);

Drehzahl_Motor_10V_tacho = abs(f_DFT_10V_tacho(maxind10_tacho))/(18*4)
Drehzahl_Motor_20V_tacho = abs(f_DFT_20V_tacho(maxind20_tacho))/(18*4)
Drehzahl_Motor_30V_tacho = abs(f_DFT_30V_tacho(maxind30_tacho))/(18*4)

Drehzahl_Motor_10V_tacho/Drehzahl_Motor_10V_strom
Drehzahl_Motor_20V_tacho/Drehzahl_Motor_20V_strom
Drehzahl_Motor_30V_tacho/Drehzahl_Motor_30V_strom

