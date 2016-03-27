

format shorteng
LETdat = csvread('data.csv');
x=LETdat(:,1);
Y=LETdat(:,3).*1000;
z=[];
for n=1:4
switch n
case 1
Ln=0.487; Cs=1.71e-5; W=4.95; s=1.422;
case 2
Ln=136.8; Cs=1.2e-5; W=350; s=3.0;
case 3
Ln=0.6; Cs=2.6e-5; W=4.4; s=0.7;
case 4
Ln=1.01; Cs=4.985E-6; W=2.036; s=1.014;
end
y=Cs*(1-exp(-(((x-Ln)/W).^s))).*(x>Ln)*0.0001;
z=[z trapz(x,y.*LETdat(:,3))];
Y=[Y y];
end

z

loglog(repmat(x,[1 5]),Y);

legend({'LET spectrum','nmos2164','CMOS R160-25','Bipolar 93L422','SMJ329C50'})
xlabel('LET [MeV cm^2/mg]')
ylabel('Differential Flux [MeV cm^2/mg]');
grid on

set(gca, 'Xlim', [1 4E4]);
set(gca, 'Ylim', [10E-12 10E9]);