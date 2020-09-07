% Simulate two return series
% simulate Moving average, MA(1)
modelMA01 = arima('constant', 0.1, 'MA', 0.85, 'variance', 0.15);
rng('default')
MA01=simulate(modelMA01,1000);
figure
subplot(2,1,1)
plot(MA01)
title('Simulated MA(1)')

% simulate Moving average, MA(2)
modelMA02 = arima('constant',0.3,'MA',{0.85,0.1},'variance',0.15);
rng('default')
MA02=simulate(modelMA02,1000);
subplot(2,1,2)
plot(MA02)
title('Simulated MA(2)')

% Autocorrelation and partial autocorrelation
figure;
subplot(2, 1, 1);
autocorr(MA01);
title('ACF for MA(1)');
subplot(2, 1, 2);
parcorr(MA01);
title('PACF for MA(1)');

figure;
subplot(2, 1, 1);
autocorr(MA02);
title('ACF for MA(2)');
subplot(2, 1, 2);
parcorr(MA02);
title('PACF for MA(2)');

% Estimate model parameters: Model 1
model01 = arima('MAlags', 1);
ESTmodel01 = estimate(model01, MA01);

% Check stationarity
[res01,v01,logl01]=infer(ESTmodel01,MA01);
stdres01=res01./sqrt(v01);

% for return series - serial correlation and ARCH-effect check
disp('MODEL 1 diagnostics')
[h, p, Qstat, Critical]=lbqtest(stdres01,'Lags',[5 10 15])
[h, p, Qstat, Critical]=archtest(stdres01,'Lags',[5 10 15])


% Estimate model parameters: Model 2
model02 = arima('MAlags', 2);
ESTmodel02 = estimate(model02, MA02);

% Check stationarity
[res02,v02,logl02]=infer(ESTmodel02,MA02);
stdres02=res02./sqrt(v02);

% for return series - serial correlation and ARCH-effect check
disp('MODEL 2 diagnostics')
[h, p, Qstat, Critical]=lbqtest(stdres02,'Lags',[5 10 15])
[h, p, Qstat, Critical]=archtest(stdres02,'Lags',[5 10 15])













