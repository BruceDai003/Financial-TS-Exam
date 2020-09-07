load Data_GlobalIdx1.mat
priceNIK = DataTable.NIK;
rNIK = 100*price2ret(priceNIK);
T = length(rNIK);

model = arima('MALags',1,'Variance',gjr(1,1));
fit = estimate(model,rNIK);

[E0,V0] = infer(fit,rNIK);
[Y,YMSE,V] = forecast(fit,5,'Y0',rNIK,'E0',E0,'V0',V0);

p = 0.025;
capital = 100000;
gjrNquantileVaR = Y(1) + norminv(p,0,1) * sqrt(V(1));
gjrNVaR = capital * gjrNquantileVaR / 100;
