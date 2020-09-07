%01 setup the information of portfolio-blotter
Asset={'Forex', 'bond', 'large-cap equity', 'small-cap equity'};
Price=[73; 120; 32; 45];
Holding=[40000; 35000; 45000; 15000];
UnitCost=[10/10000;20/10000;10/10000;30/10000];   %transaction cost

Blotter=dataset({Price,'Price'},{Holding,'InitHolding'},'obsnames',Asset);
Wealth = sum(Blotter.Price.*Blotter.InitHolding)
Blotter.InitPort=(Blotter.Price.*Blotter.InitHolding)/Wealth;
Blotter.UnitCost=UnitCost;
disp(Blotter);

%02 Simulate asset price
AssetMean=[0.08; 0.23; 0.15; 0.13];
AssetCovar=[  0.0064  0.00408 0.00192 0.00000;
              0.00408 0.0289  0.0204  0.0119;
              0.00192 0.0204  0.0576  0.0336;
0.0000  0.0119  0.0336  0.1225];
X=portsim(AssetMean'/12,AssetCovar/12,72); %6 years
[Y,T]=ret2tick(X,[],1/12);                 %return to price
plot(T,log(Y));
title('Simulated Asset Price from Return series');
xlabel('Year');
ylabel('Log Price');
legend(Asset)

%03 construct a portfolio
p=Portfolio('Name','Asset Allocation Portfolio','AssetList',Asset,'InitPort',Blotter.InitPort);
p=setDefaultConstraints(p);
p=setGroups(p,[1,0,0,0],[],0.15);   %Equity allocation is no more than 85% of the portfolio
p=addGroups(p,[0,0,1,1],[],0.45);   %Emerging equity is no more than 35% of the portfolio
p=setAssetMoments(p,AssetMean/12,AssetCovar/12);   %Portfolio weights are nonnegative and sum to 1.
p=estimateAssetMoments(p,Y,'DataFormat','Prices');
p.AssetMean=12*p.AssetMean;
p.AssetCovar=12*p.AssetCovar;
disp(p);

%04 Validate your portfolio
[lowerbound, upperbound]=estimateBounds(p);
disp('lowerboundupperbound')
disp([lowerbound,upperbound]);

%05 Plot efficient frontier
figure;
plotFrontier(p,30);
hold on


