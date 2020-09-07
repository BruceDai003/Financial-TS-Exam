clear;clc;
% data handling
load Data_FXRates
priceAUD=DataTable.AUD;
returnAUD=price2ret(priceAUD);
sizeAUD=length(returnAUD);

%MODEL A AR(1)-GARCH(1,1) normal
modelA=arima('ARlags',1,'Variance',garch(1,1))
ESTmodelA=estimate(modelA,returnAUD)

%MODEL B AR(1)-GARCH(1,1) student-t(dof)
modelB=arima('ARlags',1,'Variance',garch(1,1),'distribution','t')
ESTmodelB=estimate(modelB,returnAUD)

%MODEL C AR(1)-gjr(1,1) student-t(dof)
modelC=arima('ARlags',1,'Variance',gjr(1,1),'distribution','t')
ESTmodelC=estimate(modelC,returnAUD)

[resA,vA,logLA]=infer(ESTmodelA,returnAUD);
[resB,vB,logLB]=infer(ESTmodelB,returnAUD);
[resC,vC,logLC]=infer(ESTmodelC,returnAUD);

[aic,bic]=aicbic([logLA,logLB,logLC],[5,6,7],sizeAUD)





