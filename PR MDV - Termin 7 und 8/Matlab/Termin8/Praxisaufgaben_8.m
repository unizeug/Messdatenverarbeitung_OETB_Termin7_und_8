% Praxisaufgaben 8

close all; clc, clear;

datensatz=1;

if datensatz==1
    load('daten_fehlerfrei_2mA');
    x = daten_fehlerfrei;
end
if datensatz==2
    load('daten_Lamellenfehler_20mA');
    x = daten_Lamellenfehler;
end
if datensatz == 3
    load('daten_fehlerfrei_hochlaufen_acdc_100mA');
    x = daten_fehlerfrei_hochlaufen_acdc_100mA;
end


disp(length(x));

lastlvl = 1;

Bilder_abspeichern = 1;

S = haardeclevel_8_1_2(x,lastlvl);

fignum=801;
for lvl=1:lastlvl
    %% errechnen der Approximation und Details des jeweiligen Levels
    [u v] = getAppDet_8_1_3(S, lvl);
    
    [ud vd] = Daubechies_Wavelets(x,lvl,'db3');

    %% Strecken des Approximation und der Details
    N=length(u);
    u2=ones(1,N*2^lvl);
    v2=ones(1,N*2^lvl);
    
    ud2   = ones(1,N*2^lvl);
    vd2   = ones(1,N*2^lvl);
    
    j=1;
%     Die Approximation und die Details auf die L�nge von x normieren
    for i=1:N
        for k=1:2^lvl
            u2(j)    = u(i);
            v2(j)    = v(i);
            ud2(j)   = ud(i);
            vd2(j)   = vd(i);
            j = j+1;
        end
    end
    
    %% plotten der Approximation und der Details
    %Haar-Wavelet
    figure(fignum);
    hold on
        plot(x)
        plot(u2,'r')
        plot(v2,'c')
    hold off
    if datensatz == 1
        title(['\bf (ges�ttigt, fehlerfrei) Haar Wavlet Stufe',num2str(lvl)]);
    end
    if datensatz ==2
        title(['\bf (ges�ttigt, Lamellenfehler) Haar Wavlet Stufe',num2str(lvl)]);    
    end
    if datensatz == 3
        title(['\bf (hochfahrend, fehlerfrei) Haar Wavlet Stufe',num2str(lvl)]);        
    end
    xlabel('Zeit [s]');
    ylabel('Amplitude [A]');
    legend('Originalsignal','Approximation','Details');

    if Bilder_abspeichern == 1
         figure(fignum);
         if datensatz == 1   
            name=['../../Bilder/Termin8/fehlerfrei_gesaettigt_Haar_Wavlet_lvl_',num2str(lvl),'.pdf'];
         end
         if datensatz == 2
             name=['../../Bilder/Termin8/lamellenfehler_gesaettigt_Haar_Wavlet_lvl_',num2str(lvl),'.pdf'];
         end
         if datensatz == 3
             name=['../../Bilder/Termin8/fehlerfrei_hochlaufen_Haar_Wavlet_lvl_',num2str(lvl),'.pdf'];
         end
         print('-painters','-dpdf','-r600',name)
    end

    fignum= fignum+1;

    % Daubechies-Wavelet
    
    figure(fignum);
    hold on
        plot(x)
        plot(ud2,'r')
        plot(vd2,'c')
    hold off
    xlabel('Zeit [s]');
    ylabel('Amplitude [A]');
    legend('Originalsignal','Approximation','Details');
    
    if datensatz == 1
        title(['\bf (ges�ttigt, fehlerfrei) Daubechies Wavlet Stufe ',num2str(lvl)]);
    end
    if datensatz == 2
        title(['\bf (ges�ttigt, lamellenfehler) Daubechies Wavlet Stufe ',num2str(lvl)]);
    end
    if datensatz == 3
        title(['\bf (hochfahrend, fehlerfrei) Daubechies Wavlet Stufe ',num2str(lvl)]);        
    end
    
    if Bilder_abspeichern == 1
        figure(fignum);
         if datensatz == 1   
            name=['../../Bilder/Termin8/fehlerfrei_gesaettigt_Daubechies_Wavlet_lvl_',num2str(lvl),'.pdf'];
         end
         if datensatz == 2
             name=['../../Bilder/Termin8/lamellenfehler_gesaettigt_Daubechies_Wavlet_lvl_',num2str(lvl),'.pdf'];
         end
         if datensatz == 3
             name=['../../Bilder/Termin8/fehlerfrei_hochlaufen_Daubechies_Wavlet_lvl_',num2str(lvl),'.pdf'];
         end
         
         print('-painters','-dpdf','-r600',name)
    end
    
    fignum= fignum+1;
    
end


wn = ones(1,length(x));
fs = 200000;


Spektrum(x, wn', fs, 1,'b',-1000,1000,-100,30, fignum);

    if Bilder_abspeichern == 12113
         figure(fignum);
         if datensatz == 12113
            name=['../../Bilder/Termin8/fehlerfrei_gesaettig_Spektrum.pdf'];
         end
         if datensatz == 2
             name=['../../Bilder/Termin8/lamellenfehler_gesaettig_Spektrum.pdf'];
         end
         if datensatz == 3
             name=['../../Bilder/Termin8/fehlerfrei_hochlaufen_Spektrum.pdf'];
         end
         print('-painters','-dpdf','-r600',name)
    end

fignum=fignum+1;
figure(fignum);
spectrogram(x,512,255,512,5000)

    if Bilder_abspeichern == 12113
         figure(fignum);
         
         if datensatz == 1
            name=['../../Bilder/Termin8/fehlerfrei_gesaettigt_Spectrogam.pdf'];
         end
         if datensatz == 2
             name=['../../Bilder/Termin8/lamellenfehler_gesaettigt_Spectrogam.pdf'];
         end
         if datensatz == 3
             name=['../../Bilder/Termin8/fehlerfrei_hochlaufen_Spectrogam.pdf'];
         end
         print('-painters','-dpdf','-r200',name)
    end
