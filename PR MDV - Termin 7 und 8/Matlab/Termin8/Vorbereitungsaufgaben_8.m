% Vorbereitungsaufgaben 8

close all; clc, clear;

load('strom');

Bilder_abspeichern = 0;

S = haardeclevel_8_1_2(x,5);

fignum=801;
for lvl=1:5
    %% errechnen der Approximation und Details des jeweiligen Levels
    [u v] = getAppDet_8_1_3(S, lvl);
    
    [ud vd] = Daubechies_Wavelets(x,lvl,'db3');
    [ud1  vd1] = Daubechies_Wavelets(x,lvl,'db1');
    [ud5  vd5] = Daubechies_Wavelets(x,lvl,'db5');
    [ud10 vd10] = Daubechies_Wavelets(x,lvl,'db10');
    [ud15 vd15] = Daubechies_Wavelets(x,lvl,'db15');
    
    %% Strecken des Approximation und der Details
    N=length(u);
    u2=ones(1,N*2^lvl);
    v2=ones(1,N*2^lvl);
    
    ud2   = ones(1,N*2^lvl);
    vd2   = ones(1,N*2^lvl);
    ud21  = ones(1,N*2^lvl);
    vd21  = ones(1,N*2^lvl);
    ud25  = ones(1,N*2^lvl);
    vd25  = ones(1,N*2^lvl);
    ud210 = ones(1,N*2^lvl);
    vd210 = ones(1,N*2^lvl);
    ud215 = ones(1,N*2^lvl);
    vd215 = ones(1,N*2^lvl);

    
    j=1;
%     Die Approximation und die Details auf die L�nge von x normieren
    for i=1:N
        for k=1:2^lvl
            u2(j)    = u(i);
            v2(j)    = v(i);
            ud2(j)   = ud(i);
            vd2(j)   = vd(i);
            ud21(j)  = ud1(i);
            vd21(j)  = vd1(i);
            ud25(j)  = ud5(i);
            vd25(j)  = vd5(i);
            ud210(j) = ud10(i);
            vd210(j) = vd10(i);
            ud215(j) = ud15(i);
            vd215(j) = vd15(i);
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
    title(['\bf Haar Wavlet Stufe',num2str(lvl)]);
    xlabel('Zeit [s]');
    ylabel('Amplitude [A]');
    legend('Originalsignal','Approximation','Details');

    if Bilder_abspeichern == 1
         figure(fignum);
         name=['../../Bilder/Termin8/Haar_Wavlet_lvl_',num2str(lvl),'.pdf'];
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
    
    title(['\bf Daubechies Wavlet Stufe ',num2str(lvl)]);
    
    if Bilder_abspeichern == 1
         figure(fignum);
         name=['../../Bilder/Termin8/Daubechies_Wavlet_lvl_',num2str(lvl),'.pdf'];
         print('-painters','-dpdf','-r600',name)
    end
    
    fignum= fignum+1;

    % 1db Daubechies-Wavelet
    
    figure(fignum);
    hold on
        plot(x)
        plot(ud21,'r')
        plot(vd21,'c')
    hold off
    xlabel('Zeit [s]');
    ylabel('Amplitude [A]');
    legend('Originalsignal','Approximation','Details');

    
    title(['\bf Daubechies Wavlet 1dB Stufe ',num2str(lvl)]);
    
    if Bilder_abspeichern == 1
         figure(fignum);
         name=['../../Bilder/Termin8/Daubechies_Wavlet_1db_lvl_',num2str(lvl),'.pdf'];
         print('-painters','-dpdf','-r600',name)
    end
    
    fignum= fignum+1;
    
    % 5db Daubechies-Wavelet
    
    figure(fignum);
    hold on
        plot(x)
        plot(ud25,'r')
        plot(vd25,'c')
    hold off
    title(['\bf Daubechies Wavlet 5dB Stufe ',num2str(lvl)]);
    xlabel('Zeit [s]');
    ylabel('Amplitude [A]');
    legend('Originalsignal','Approximation','Details');
        
    if Bilder_abspeichern == 1
         figure(fignum);
         name=['../../Bilder/Termin8/Daubechies_Wavlet_5db_lvl_',num2str(lvl),'.pdf'];
         print('-painters','-dpdf','-r600',name)
    end
    
    fignum= fignum+1;
    
    % 10db Daubechies-Wavelet
    
    figure(fignum);
    hold on
        plot(x)
        plot(ud210,'r')
        plot(vd210,'c')
    hold off

    xlabel('Zeit [s]');
    ylabel('Amplitude [A]');
    legend('Originalsignal','Approximation','Details');

    title(['\bf Daubechies Wavlet 10dB Stufe ',num2str(lvl)]);
    
    if Bilder_abspeichern == 1
         figure(fignum);
         name=['../../Bilder/Termin8/Daubechies_Wavlet_10db_lvl_',num2str(lvl),'.pdf'];
         print('-painters','-dpdf','-r600',name)
    end
    
    fignum= fignum+1;
    
    % 15db Daubechies-Wavelet
    
    figure(fignum);
    hold on
        plot(x)
        plot(ud215,'r')
        plot(vd215,'c')
    hold off

    xlabel('Zeit [s]');
    ylabel('Amplitude [A]');
    legend('Originalsignal','Approximation','Details');

    
    
    title(['\bf Daubechies Wavlet 15dB Stufe ',num2str(lvl)]);
    
    if Bilder_abspeichern == 1
         figure(fignum);
         name=['../../Bilder/Termin8/Daubechies_Wavlet_15db_lvl_',num2str(lvl),'.pdf'];
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
