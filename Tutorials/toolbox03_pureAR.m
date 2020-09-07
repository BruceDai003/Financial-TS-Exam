%Data Handling
load Data_EquityIdx;
priceNYSE=DataTable.NYSE;
returnNYSE=price2ret(priceNYSE);
subplot(3,1,1)
plot(returnNYSE)
title('return for NYSE')

%simulate return using AR(1), phi=0.5
modelAR01=arima('constant',0,'AR',0.5,'variance',0.0001)
rng('default')
AR1=simulate(modelAR01,3027)
subplot(3,1,2)
plot(AR1)
title('Simulation for AR(1), phi=0.5')


