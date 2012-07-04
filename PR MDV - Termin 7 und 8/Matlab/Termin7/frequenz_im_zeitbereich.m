% berechnet und plottet den Zeitbereich des Frequenzsignals
function frequenz_im_zeitbereich (x_t,t)

N = length(t);
abtastfrequenz = 1/N;
abtastwerte = ones(N,1);

miximas = zeros(N,1);
null= zeros(N,1);
minimas = zeros(N,1);

%indizes 
for i=1:N
   if x_t(i)>0.99
       maximas(i) =1;
   end
end

figure(101)
hold on
    plot(t,x_t);
    %stem(t,indizes,'c');
    %stem(t,abtastwerte,'c');
hold off