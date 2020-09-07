
%Data Handling
load Data_EquityIdx;
priceNYSE=DataTable.NYSE;
returnNYSE=price2ret(priceNYSE);

%plot the price and return for NYSE
subplot(2,1,1)
plot(priceNYSE)
title('price for NYSE')

subplot(2,1,2)
plot(returnNYSE)
title('return for NYSE')
