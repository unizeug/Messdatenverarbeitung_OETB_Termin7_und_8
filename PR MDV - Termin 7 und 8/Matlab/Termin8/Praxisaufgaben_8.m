% Praxisaufgaben 8

close all; clc, clear;

load('daten_fehlerfrei_2mA');

x = daten_fehlerfrei;

Bilder_abspeichern = 0;

S = haardeclevel_8_1_2(x,5);

fignum=801;
for lvl=1:5
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
    title(['\bf (ges�ttigt, fehlerfrei) Haar Wavlet Stufe',num2str(lvl)]);
    xlabel('Zeit [s]');
    ylabel('Amplitude [A]');
    legend('Originalsignal','Approximation','Details');

    if Bilder_abspeichern == 1
         figure(fignum);
         name=['../../Bilder/Termin8/fehlerfrei_gesaettigt_Haar_Wavlet_lvl_',num2str(lvl),'.pdf'];
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
    
    title(['\bf (ges�ttigt, fehlerfrei) Daubechies Wavlet Stufe ',num2str(lvl)]);
    
    if Bilder_abspeichern == 1
         figure(fignum);
         name=['../../Bilder/Termin8/fehlerfrei_gesaettigt_Daubechies_Wavlet_lvl_',num2str(lvl),'.pdf'];
         print('-painters','-dpdf','-r600',name)
    end
    
    fignum= fignum+1;
    
end


wn = ones(1,length(x));
fs = 1;

Spektrum(x, wn, fs, 1,'b',-0.6,0.6,-100,30, fignum);

    if Bilder_abspeichern == 1
         figure(fignum);
         name=['../../Bilder/Termin8/Spektrum.pdf'];
         print('-painters','-dpdf','-r600',name)
    end

fignum=fignum+1;
figure(fignum);
spectrogram(x,25,24)

    if Bilder_abspeichern == 1
         figure(fignum);
         name=['../../Bilder/Termin8/Spectrogam.pdf'];
         print('-painters','-dpdf','-r600',name)
    end