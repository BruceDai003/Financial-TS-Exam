%Data Handling
load Data_EquityIdx;
priceNYSE=DataTable.NYSE;
returnNYSE=price2ret(priceNYSE);

%ARCH test
residualNYSE=returnNYSE-mean(returnNYSE);
[h,p,Fstat,Critical]=archtest(residualNYSE,'lags',[5,10,15])