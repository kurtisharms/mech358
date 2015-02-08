%   problem2.m
%   Author: Kurtis Harms
%   Student #38764114
%   MECH 358 Lab 2
%   Purpose: Problem 2, a convective heat transfer problem
%   Required Files: solve_bvp.m
clear;
clc;

Pe_values = 1;
h_values = [1,0.1];
L_values = [10,50,100];

colors = ['r','b','k','g'];

T_bvs = [1 0];

Pe = 1;



i = 1;
for L = L_values
    h = 0.1;
    
    x = 0:0.01:L;
    y = exp(-Pe.*x);
    plot(x,y,colors(i));
    i = i+1;
end

legend('L=10','L=50','L=100');
title('T(x) vs. x Analytical Solution');
xlabel('x')
ylabel('(T(x)');



figure(20);
hold on;

i = 1;
L = 100;

for h = h_values
    T = solve_bvp(L,h,Pe,T_bvs(1),T_bvs(2));

    x = 0:h:L;
    plot(x,T,colors(i));

    i = i+1;
end


title('T(x) vs. x numerical solutions for L=100 and varying h');
xlabel('x')
ylabel('(T(x)');










