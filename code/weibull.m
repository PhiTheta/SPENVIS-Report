clear all;

flips =[8 7497 22514 23986 33810 29991 21022 18043];
exTime = [5 5 5 5 5 10 10 15];
flux = [25e6 25e6 25e6 17e6 23e6 10e6 7e6 4e6];
energyBeam = [0.6 0.72 9.6 4.8 20 56 84 786];
u = [12 12 12 16 40 56 84 131];
energy = energyBeam./(u);
crossSec=flips./(exTime.*60.*flux);
LET = [2.73E+03 3.13E+03 4.65E+03 7.23E+03 1.77E+04 2.77E+04 3.74E+04 5.72E+04]./1000; %MEV cm^2/mg

[fitresult, gof] = createFit(LET, crossSec);
parameters = coeffvalues(fitresult);
close all;
x = 1:0.1:60;
y = parameters(1)*(1-exp(-((x-parameters(2)))./parameters(3)).^parameters(4));
hold on
plot(LET, crossSec, 'xb');
plot(x,y,'r');
hold off;