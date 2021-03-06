clear;clc;

% % data handling
load Data_FXRates
priceAUD=DataTable.AUD;
returnAUD=price2ret(priceAUD);
sizeAUD=length(returnAUD);
% figure
% subplot(2,1,1)
% plot(priceAUD)
% title('AUD price index')

% subplot(2,1,2)
% plot(returnAUD)
% title('AUD return')
% 
% %ACF and PACF
% figure
% subplot(2,1,1)
% autocorr(priceAUD)
% title('ACF for AUD price index')
% subplot(2,1,2)
% parcorr(priceAUD)
% title('PACF AUD price index')
% 
% figure
% subplot(2,1,1)
% autocorr(returnAUD)
% title('ACF for AUD return')
% subplot(2,1,2)
% parcorr(returnAUD)
% title('PACF AUD return')
% 
% %LBQ test for return
% [h, p, Qstat, Critical]=lbqtest(returnAUD,'lags',[5 10 15])
% 
% %ARCH test for return
% [h, p, Fstat, Critical]=archtest(returnAUD-mean(returnAUD),'lags',[5 10 15])

% %construct AR(1)-GARCH(1,1) normal
modelA=arima('ARlags',1,'Variance',garch(1,1))
ESTmodelA=estimate(modelA,returnAUD)

%construct AR(1)-GARCH(1,1) student-t(dof)
modelB=arima('ARlags',1,'Variance',garch(1,1),'distribution','t')
ESTmodelB=estimate(modelB,returnAUD)

[resA,vA,logLA]=infer(ESTmodelA,returnAUD);
[resB,vB,logLB]=infer(ESTmodelB,returnAUD);

[aic,bic]=aicbic([logLA,logLB],[5,6],sizeAUD)





