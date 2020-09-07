%Long position VaR determination using Normal and Student-t distribution
clear;clc;format compact;
p=[0.05 0.025 0.01];   % 5%VaR, 2.5%VaR, 1%VaR
capital=100000;

quantileNORMAL=norminv(p,0,1)
VaR_NORMAL=capital*quantileNORMAL/100   % return in percentage

quantileT=tinv(p,5)
VaR_T=capital*quantileT/100