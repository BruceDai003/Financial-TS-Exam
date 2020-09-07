load Data_GlobalIdx1.mat
priceNIK = DataTable.NIK;
rNIK = 100*price2ret(priceNIK);
T = length(rNIK);

% plot the histogram
% histogram with Normal distribution
figure
histfit(rNIK, 150, 'normal')
title('Normal distribution fit');
figure
histfit(rNIK, 150, 'tlocationscale')
title('Student-t distribution fit');

% 2.5% and 1% daily VaR
capital=100000;
sort_rNIK = sort(rNIK);

p=0.025;
quantileVaR = round(p * T);
VaRHS025 = capital * sort_rNIK(quantileVaR)/100; % 2.5% VaR
ESHS025 = capital * mean(sort_rNIK(1:quantileVaR))/100; % 2.5% ES

p=0.01;
quantileVaR = round(p * T);
VaRHS001 = capital * sort_rNIK(quantileVaR)/100; % 1% VaR
ESHS001 = capital * mean(sort_rNIK(1:quantileVaR))/100; % 1% ES


