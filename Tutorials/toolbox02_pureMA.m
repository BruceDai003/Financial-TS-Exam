
%Data Handling
load Data_EquityIdx;
priceNYSE=DataTable.NYSE;
returnNYSE=price2ret(priceNYSE);
subplot(3,1,1)
plot(returnNYSE)
title('return for NYSE')

%simulate Moving average, MA(1),theta=0.1
modelMA01=arima('constant',0,'MA',0.1,'variance',0.001)
rng('default')
MA01=simulate(modelMA01,3027);
subplot(3,1,2)
plot(MA01)
title('Simulated MA(1) theta=0.1')

%simulate Moving average, MA(2),theta01=0.1, theta02=0.6
modelMA02=arima('constant',0,'MA',{0.1,0.6},'variance',0.001)
rng('default')
MA02=simulate(modelMA02,3027);
subplot(3,1,3)
plot(MA02)
title('Simulated MA(2) theta01=0.1 and theta02=0.6')

