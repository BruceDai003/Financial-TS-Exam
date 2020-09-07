capital = 500000;
ret = 5.5 / 100;
withdraw = 40000;
inf_rate = 3.5 / 100;
inc_rate = 0.025 / 100;

withdraw_list = [];
balances_list = [];
withdraw_list(end+1) = withdraw;
remained_amount = capital*(1 + ret) - withdraw;
balances_list(end+1) = remained_amount;
year = 1;
while remained_amount >= 0
    year = year + 1;
    inf_rate = inf_rate + inc_rate;
    withdraw = withdraw * (1 + inf_rate);
    withdraw_list(end+1) = withdraw;
    remained_amount = remained_amount*(1 + ret) - withdraw;
    balances_list(end+1) = remained_amount;
end

if balances_list(end) < 0
    withdraw_list(end) = withdraw_list(end) + balances_list(end);
    balances_list(end) = 0;
end

% bar plot
figure;
bar([withdraw_list', balances_list'], 'stacked');
legend('withdrawals', 'balances');