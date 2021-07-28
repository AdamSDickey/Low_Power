x=[];
%Seizure-free (SF) and ipsilateral inter-ictal discharges (I), 
%Seizure-Free and bilateral inter-ictal discharges (B), 
%Not seizure-free (NSF) and ipsilateral inter-ictal discharges, 
%Not seizure-free and bilateral ictal-ictal discharges.

%Column 1 - 4: SF,Ipsi  NSF,Ipsi  SF,Bil  NSF,Bil
x(1,:)=[99 18 35 23]; %Radhakrishnan
x(2,:)=[55 8 23 7];   %Jeong
x(3,:)=[73 24 22 16]; %Aull-Watchinger*
x(4,:)=[65 25 13 13]; %Hennessy#

disp('Total #s:')
disp('  SF-I   NSF-I SF-B  NSF-B')
disp(sum(x))

%%

%Notes:
%*OR reported as 2.56 in the manuscript, but number of patients and percentage matches data above.  
%#The number of bilateral IED absent assumed to be 26, not 25, given 50% seizure free is not possible with 25 patients.

%Compute Odds Ratio
for i=1:4
    OR(i)=(x(i,1)/x(i,2))/(x(i,3)/x(i,4));
    [h pVal(i)]=fishertest([x(i,1:2); x(i,3:4)]);
end
OR

y=sum(x);
%pools OR, % SF, % NF
OR_pool=(y(1)/y(2))/(y(3)/y(4))
percSzFreePos=y(1)/(y(1)+y(2))
percSzFreeNeg=y(3)/(y(3)+y(4))


