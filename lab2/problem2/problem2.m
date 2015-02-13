%   problem2.m
%   Authors:    Kurtis Harms (38764114)
%               Ecem 
%   MECH 358 Lab 2
%   Purpose: Problem 2, a convective heat transfer problem
%   Required Files: solve_bvp.m
clear;
clc;

Pe_values = 1;
h_values = [0.1,1];
L_values = [10,50,100];

colors = ['r','b','k','g','y'];
linewidth = [1,1,2,2,2];

T_bvs = [1 0];

Pe = 1;

i = 1;
for L = L_values    
    
    figure(i);
    hold on;
   
    j = 1;
    for h = h_values
        
        % Create and plot analytical solution
        x = 0:0.001:L;
        y = exp(-Pe.*x);
        plot(x,y,colors(j));
        
        % Create and plot numerical solution
        T = solve_bvp(L,h,Pe,T_bvs(1),T_bvs(2));
        x = 0:h:L;
        plot(x,T,colors(j+1),'linewidth',linewidth(i));

        j = j+2;
    end
    
    legend('Analytical Solution', ...
    'Numerical Solution with h=0.1', ...
    'Analytical Solution with h=1', ...
    'Numerical Solution with h=1');
    title(strcat('T(x) vs. x Analytical Solution for L=',num2str(L)));
    xlabel('x')
    ylabel('T(x)');
    
    i = i+1;
end



figure(20);
hold on;

i = 1;
L = 100;
h_values = [0.01,0.1,1,5,10];

for h = h_values
    T = solve_bvp(L,h,Pe,T_bvs(1),T_bvs(2));

    x = 0:h:L;
    plot(x,T,colors(i),'linewidth',linewidth(i));

    i = i+1;
end


title('T(x) vs. x numerical solutions for L=100 and varying h');
legend('h=0.01','h=0.1','1','5','10');
xlabel('x')
ylabel('(T(x)');










