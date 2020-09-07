load Data_FXRates.mat

price = DataTable.JPY;
ret = price2ret(price);

%ACF for JPY return
ACFret = autocorr(ret, 5)

%Ljung-Box Qtest for JPY return
[h,p,Qstat,Critical] = lbqtest(ret,'lags',5 )

% The results are the same.

% Construct AR(1) - GARCH(1, 1) nromal
modelA = arima('ARlags',1,'Variance',garch(1,1))
ESTmodelA = estimate(modelA, ret)

% Construct AR(1)-GARCH(1,1) student-t(dof)
modelB = arima('ARlags',1,'Variance',garch(1,1),'distribution','t')
ESTmodelB = estimate(modelB, ret)