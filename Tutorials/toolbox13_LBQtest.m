%Data Handling
load Data_EquityIdx;
priceNYSE=DataTable.NYSE;
returnNYSE=price2ret(priceNYSE);

%plot the price NYSE
% subplot(2,1,1)
% plot(priceNYSE)
% title('price for NYSE')
% subplot(2,1,2)
% autocorr(priceNYSE)
% title('ACF for priceNYSE')

%plot the return NYSE
% figure
% subplot(2,1,1)
% plot(returnNYSE)
% title('return for NYSE')
% subplot(2,1,2)
% autocorr(returnNYSE)
% title('ACF for returnNYSE')

%ACF for NYSE price
ACFpriceNYSE=autocorr(priceNYSE,8)

%Ljung-Box Qtest for NYSE price
[h,p,Qstat,Critical]=lbqtest(priceNYSE,'lags',[5 10 15])

%ACF for NYSE return
ACFreturnNYSE=autocorr(returnNYSE,8)

%Ljung-Box Qtest for NYSE return
[h,p,Qstat,Critical]=lbqtest(returnNYSE,'lags',[5 10 15])











