disp('Kang et al 2021 - 56 patients N1 vs. N2')
n1=46; n2=10;
disp([n1 n2])
disp(' ')

disp('4 cited articles - bilateral IED OR 2.5 ')
a=292/(292+75);
b=93/(93+59);
disp('Percent Seizure Free, unilateral vs. bilateral IED:')
disp([a b]*100)

%numRep=100000;
numRep=10000; %Uncomment for faster run time

x=binornd(n1,a,numRep,1);
y=binornd(n2,b,numRep,1);

tic
for i=1:numRep
    if(mod(i,1000)==0)
        disp(i)
    end
    z=[x(i) n1-x(i); y(i) n2-y(i)];
    [h pVal(i)]=fishertest(z);
end
toc
powerFisher=sum(pVal<=.05)/numRep

%%
%Calculate odds
disp('Percent Seizure Free, Unilateral IEDs')
preOdds=33/13;
prePerc=preOdds/(1+preOdds);
disp(prePerc*100)

disp('Percent Seizure Free, Bilateral IED with OR=0.05')
postOdds1=preOdds*.05;
postPerc1=postOdds1/(1+postOdds1);
disp(postPerc1*100)

disp('Percent Seizure Free, Bilateral IED with OR=0.40')
postOdds2=preOdds*.4;
postPerc2=postOdds2/(1+postOdds2);
disp(postPerc2*100)

