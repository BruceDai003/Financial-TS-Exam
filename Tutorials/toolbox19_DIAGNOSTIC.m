clear;clc;
% data handling
load Data_FXRates
priceAUD=DataTable.AUD;
returnAUD=price2ret(priceAUD);
sizeAUD=length(returnAUD);

%MODEL A AR(1)-GARCH(1,1) normal
modelA=arima('ARlags',1,'Variance',garch(1,1))
ESTmodelA=estimate(modelA,returnAUD)

% %MODEL B AR(1)-GARCH(1,1) student-t(dof)
modelB=arima('ARlags',1,'Variance',garch(1,1),'distribution','t')
ESTmodelB=estimate(modelB,returnAUD)
% 
% %MODEL C AR(1)-gjr(1,1) student-t(dof)
modelC=arima('ARlags',1,'Variance',gjr(1,1),'distribution','t')
ESTmodelC=estimate(modelC,returnAUD)

%MODEL A
%generating residual, conditional stdev, loglikelihood 
[resA,vA,logLA]=infer(ESTmodelA,returnAUD);

%standardized residual
stdresA=resA./sqrt(vA);

disp('MODEL A')

%diagnose return (Ljung-Box Q test)
[h,p,Qstat,Crit]=lbqtest(stdresA,'Lags',[5 10 15])

%diagnose volatility (ARCH-test)
[h,p,Qstat,Crit]=archtest(stdresA,'Lags',[5 10 15])

%MODEL B
%generating residual, conditional stdev, loglikelihood 
[resB,vB,logLB]=infer(ESTmodelB,returnAUD);

%standardized residual
stdresB=resB./sqrt(vB);

disp('MODEL B')

%diagnose return (Ljung-Box Q test)
[h,p,Qstat,Crit]=lbqtest(stdresB,'Lags',[5 10 15])

%diagnose volatility (ARCH-test)
[h,p,Qstat,Crit]=archtest(stdresB,'Lags',[5 10 15])


%MODEL C
%generating residual, conditional stdev, loglikelihood 
[resC,vC,logLC]=infer(ESTmodelC,returnAUD);

%standardized residual
stdresC=resC./sqrt(vC);

disp('MODEL C')

%diagnose return (Ljung-Box Q test)
[h,p,Qstat,Crit]=lbqtest(stdresC,'Lags',[5 10 15])

%diagnose volatility (ARCH-test)
[h,p,Qstat,Crit]=archtest(stdresC,'Lags',[5 10 15])


















