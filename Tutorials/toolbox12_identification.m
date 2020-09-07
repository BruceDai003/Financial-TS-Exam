%Data Handling
% load Data_EquityIdx;
% priceNYSE=DataTable.NYSE;
% returnNYSE=price2ret(priceNYSE);
% 
% priceNASDAQ=DataTable.NASDAQ;
% returnNASDAQ=price2ret(priceNASDAQ);

load Data_FXRates
priceAUD=DataTable.AUD;
returnAUD=price2ret(priceAUD);

priceGBP=DataTable.GBP;
returnGBP=price2ret(priceGBP);

% %plot ACF and PACF
figure
subplot(2,1,1)
autocorr(returnAUD)
title('ACF for AUD')
subplot(2,1,2)
parcorr(returnAUD)
title('PACF for AUD')
% 
figure
subplot(2,1,1)
autocorr(returnGBP)
title('ACF for GBP')
subplot(2,1,2)
parcorr(returnGBP)
title('PACF for GBP')



% %plot ACF and PACF
% figure
% subplot(2,1,1)
% autocorr(returnNYSE)
% title('ACF for NYSE')
% subplot(2,1,2)
% parcorr(returnNYSE)
% title('PACF for NYSE')
% 
% figure
% subplot(2,1,1)
% autocorr(returnNASDAQ)
% title('ACF for NASDAQ')
% subplot(2,1,2)
% parcorr(returnNASDAQ)
% title('PACF for NASDAQ')
