
%PHASE2 for NASDAQ
load Data_EquityIdx;
priceNASDAQ=DataTable.NASDAQ;
returnNASDAQ=price2ret(priceNASDAQ);
returnSIZE=length(returnNASDAQ);

% STEP 1: Estimation
% MODEL01 AR(1)-GARCH(1,1) NORMAL
model01=arima('ARlags',1,'Variance',garch(1,1))
ESTmodel01=estimate(model01,returnNASDAQ)

% MODEL02 AR(1)-GARCH(1,1) STUDENT-t
model02=arima('ARlags',1,'Variance',garch(1,1),'distribution','t')
ESTmodel02=estimate(model02,returnNASDAQ)

% MODEL03 AR(1)-gjr(1,1) STUDENT-t
model03=arima('ARlags',1,'Variance',gjr(1,1),'distribution','t')
ESTmodel03=estimate(model03,returnNASDAQ)


% STEP 2: Model selection
[res01,v01,logl01]=infer(ESTmodel01,returnNASDAQ);
[res02,v02,logl02]=infer(ESTmodel02,returnNASDAQ);
[res03,v03,logl03]=infer(ESTmodel03,returnNASDAQ);

[aic bic]=aicbic([logl01,logl02,logl03],[5,6,7],returnSIZE)

% Diagnostics
stdres01=res01./sqrt(v01);
stdres02=res02./sqrt(v02);
stdres03=res03./sqrt(v03);

%for return series - serial correlation and ARCH-effect check
disp('MODEL 1 diagnostics')
[h, p, Qstat, Critical]=lbqtest(stdres01,'Lags',[5 10 15])
[h, p, Qstat, Critical]=archtest(stdres01,'Lags',[5 10 15])

disp('MODEL 2 diagnostics')
[h, p, Qstat, Critical]=lbqtest(stdres02,'Lags',[5 10 15])
[h, p, Qstat, Critical]=archtest(stdres02,'Lags',[5 10 15])

disp('MODEL 3 diagnostics')
[h, p, Qstat, Critical]=lbqtest(stdres03,'Lags',[5 10 15])
[h, p, Qstat, Critical]=archtest(stdres03,'Lags',[5 10 15])









