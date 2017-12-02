%In class 19

%GB comments
1A 100
1B 100
1C 100
2. 100
Overall 100


% Problem 1. Imagine a clincal trial for two drugs that are intended to lower
% cholesterol. Assume 30 subjects are randomly divided into 3 groups that
% either receive a placebo or one of the two treatments. The mean initials
% levels of total cholesterol in each group are the same. The final
% measurements look like

placebo = [   194   183   199   189   189   214   212   186   191   190];
treatment1 = [    138   217   188   126   249   217   255   196   279   123];
treatment2 =[   152   152   151   143   161   142   142   141   161   135];

%A. Make a bar plot of the means of each group with errorbars (Hint, use
%bar and then use 'hold on' and then errorbar). 

means = [mean(placebo),mean(treatment1),mean(treatment2)];
stds = [std(placebo),std(treatment1),std(treatment2)];
bar(means);
hold on;
errorbar(means,stds,'.');
hold off;
%B. Run a one way ANOVA analysis to see whether any of the treatment groups showed
%a statistically signficant difference. 
data = [placebo treatment1 treatment2];
names = {'placebo','placebo','placebo','placebo','placebo','placebo','placebo','placebo','placebo','placebo',...
    'treatment1','treatment1','treatment1','treatment1','treatment1','treatment1','treatment1','treatment1','treatment1','treatment1',... 
    'treatment2','treatment2','treatment2','treatment2','treatment2','treatment2','treatment2','treatment2','treatment2','treatment2'};

p = anova1(data,names);

%With a p-value of 0.0029, at least one group showed signficant difference.

%C. use the multcompare function to look at all pairs of samples and
%indicate which are significantly different. 
[p,table,stats] = anova1(data,names);
multcompare(stats)
%The means of control and treatment2 are significantly different. 

%Problem 2. In this directory, you will find a .mat file with three
%variables, xdat, ydat, and ydat2. For each pair (xdat, ydat) and (xdat,
%ydat2), fit the data to a first, second and third order polynomial. Which
%one is the best fit in each case? In at least one of the cases, do the
%problem with both the polyfit/polyval functions and with the 'fit' function.
load('data.mat');
[coeff1,s] = polyfit(xdat,ydat,1); 
[coeff2,s] = polyfit(xdat,ydat,2);
[coeff3,s] = polyfit(xdat,ydat,3);

figure;
plot(xdat, ydat,'r');
hold on;
plot(xdat, polyval(coeff1, xdat), 'y');
plot(xdat, polyval(coeff2, xdat), 'g');
plot(xdat, polyval(coeff3, xdat), 'b');
hold off;

%These polyvals are all roughly the same. The first order polynomial can be
%considered the best as it has the largest coeff. 

[coeff1,s] = polyfit(xdat,ydat2,1); 
[coeff2,s] = polyfit(xdat,ydat2,2);
[coeff3,s] = polyfit(xdat,ydat2,3);

figure;
plot(xdat, ydat2,'r');
hold on;
plot(xdat, polyval(coeff1, xdat), 'y')
plot(xdat, polyval(coeff2, xdat), 'g')
plot(xdat, polyval(coeff3, xdat), 'b')

%The third order polynomial can clearly be considered the best.

fit_out = fit(xdat',ydat','poly1');
[coeff1,s] = polyfit(xdat,ydat,1); 
figure;
plot(xdat, ydat,'g');
hold on;
plot(xdat, polyval(coeff1, xdat), 'b')
plot(fit_out,xdat, ydat, 'og')
hold off;
