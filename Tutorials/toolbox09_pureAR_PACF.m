
%simulate AutoRegressive, AR(1),psi=0.9
modelAR01=arima('constant',0,'AR',0.9,'variance',0.001)
rng('default')
AR01=simulate(modelAR01,3027);
figure
subplot(2,1,1)
autocorr(AR01)
title('ACF for AR(1),psi=0.9')
subplot(2,1,2)
parcorr(AR01)
title('PACF for AR(1),psi=0.9')


%simulate AR(2),psi01=0.1, psi02=0.6
modelAR02=arima('constant',0,'AR',{0.1,0.6},'variance',0.001)
rng('default')
AR02=simulate(modelAR02,3027);
figure
subplot(2,1,1)
autocorr(AR02)
title('ACF for AR(2)')
subplot(2,1,2)
parcorr(AR02)
title('PACF for AR(2)')

%simulate AR(3),psi01=0.1, psi02=0.3, psi03=0.4
modelAR03=arima('constant',0,'AR',{0.1,0.3,0.4},'variance',0.001)
rng('default')
AR03=simulate(modelAR03,3027);
figure
subplot(2,1,1)
autocorr(AR03)
title('ACF for AR(3)')
subplot(2,1,2)
parcorr(AR03)
title('PACF for AR(3)')
