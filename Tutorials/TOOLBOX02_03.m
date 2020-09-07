% Determine expected shortfall using normal and studentt-t distribution

p=0.05;
capital=100000;

VaRquantileNORMAL=norminv(p)
quantileESnormal=(1/p)*integral(@(r) r.*normpdf(r,0,1),-10,VaRquantileNORMAL)
ESnormal=quantileESnormal*capital/100

VaRquantileT=tinv(p,5)
quantileEST=(1/p)*integral(@(r) r.*tpdf(r,5),-10,VaRquantileT)
EST=quantileEST*capital/100
