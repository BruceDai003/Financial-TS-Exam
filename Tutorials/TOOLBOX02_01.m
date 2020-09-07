%Comparison between normal and student-t distributions

ret=-6:0.1:6;
yNORM=normpdf(ret,0,1);
yT5=tpdf(ret,5);
yT3=tpdf(ret,3);

plot(ret,yNORM,':r',ret,yT5,'--b',ret,yT3,'g')
title('Standard Normal, Student-T(v=5), Student-T(v=3)')
xlabel('return')
ylabel('probability density function')
legend('NORMAL','T(dof=5)','T(dof=3)')
