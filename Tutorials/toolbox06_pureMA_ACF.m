
%simulate Moving average, MA(1),theta=0.9
modelMA01=arima('constant',0,'MA',0.1,'variance',0.001)
rng('default')
MA01=simulate(modelMA01,3027);
figure
autocorr(MA01)
title('ACF for MA(1)')

%simulate Moving average, MA(2),theta01=0.1, theta02=0.6
modelMA02=arima('constant',0,'MA',{0.1,0.6},'variance',0.001)
rng('default')
MA02=simulate(modelMA02,3027);
figure
autocorr(MA02)
title('ACF for MA(2)')

%simulate Moving average, MA(3),theta01=0.1, theta02=0.3, theta03=0.4
modelMA03=arima('constant',0,'MA',{0.1,0.3,0.4},'variance',0.001)
rng('default')
MA03=simulate(modelMA03,3027);
figure
autocorr(MA03)
title('ACF for MA(3)')