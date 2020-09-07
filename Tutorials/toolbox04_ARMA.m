%Data Handling
load Data_EquityIdx;
priceNYSE=DataTable.NYSE;
returnNYSE=price2ret(priceNYSE);

%simulate an ARMA(1,1) phi=0.3, theta=0.4
modelARMA01=arima('constant',0,'AR',0.3,'MA',0.4,'variance',0.0001)
ARMA01=simulate(modelARMA01,3027)


figure
subplot(2,1,1)
autocorr(ARMA01)
title('ACF ARMA(1,1) phi=0.3, theta=0.4')
subplot(2,1,2)
parcorr(ARMA01)
title('PACF ARMA(1,1) phi=0.3, theta=0.4')


%simulate an ARMA(2,1) phi01=0.3,phi02=0.5, theta=0.4
modelARMA02=arima('constant',0,'AR',{0.3,0.5},'MA',0.4,'variance',0.0001)
ARMA02=simulate(modelARMA02,3027)
figure
subplot(2,1,1)
autocorr(ARMA02)
title('ACF ARMA(2,1) phi=0.3,phi02=0.5, theta=0.4')
subplot(2,1,2)
parcorr(ARMA02)
title('PACF ARMA(2,1) phi=0.3,phi02=0.5, theta=0.4')

