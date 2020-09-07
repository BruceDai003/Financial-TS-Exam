%Data Handling
load Data_EquityIdx;
priceNYSE=DataTable.NYSE;
returnNYSE=price2ret(priceNYSE);

%plot the price NYSE
subplot(3,1,1)
plot(priceNYSE)
title('price for NYSE')
subplot(3,1,2)
autocorr(priceNYSE)
title('ACF for priceNYSE')
subplot(3,1,3)
parcorr(priceNYSE)
title('PACF for priceNYSE')

%plot the return NYSE
figure
subplot(3,1,1)
plot(returnNYSE)
title('return for NYSE')
subplot(3,1,2)
autocorr(returnNYSE)
title('ACF for returnNYSE')
subplot(3,1,3)
parcorr(returnNYSE)
title('PACF for returnNYSE')






