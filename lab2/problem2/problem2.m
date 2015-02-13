%   problem2.m
%   Authors:    Kurtis Harms (38764114)
%               Ecem Kahramam (47962113)
%               Mike Wilk (21085121)
%   MECH 358 Lab 2
%   Purpose: Problem 2, a convective heat transfer problem
%   Required Files: solve_bvp.m
clear;
clc;

% We are going to keep Pe constant for this problem
Pe = 1;
h_values = [0.1,1];
L_values = [10,50,100];

% Matrices of colors and lines widths
colors = ['r','b','g','k','y'];
linewidth = [1,1,2,2,2];

% Our boundary values, correspondint to T(0) and T(infinity)
T_bvs = [1 0];

% iterator for outer loop

for L = L_values 
    % iterator for the inner loop
    i = 1;
    % We are creating a different figure for each value of L
    figure(i);
    hold on;
    
    % Create and plot analytical solution
    x = 0:0.0001:L;
    y = exp(-Pe.*x);
    plot(x,y,colors(i),'linewidth',linewidth(i));
    % iterator for inner loop
    for h = h_values
        % Increment the inner iterator
        i = i+1;
        % Create and plot numerical solution
        T = solve_bvp(L,h,Pe,T_bvs(1),T_bvs(2));
        x = 0:h:L;
        plot(x,T,colors(i),'linewidth',linewidth(i));
    end
    
    legend('Analytical Solution', ...
    'Numerical Solution with h=0.1', ...
    'Numerical Solution with h=1');
    title(strcat('T(x) vs. x Analytical & Numerical Solutions for L=',num2str(L)));
    xlabel('x')
    ylabel('T(x)');
end


% Create a new figure for the plot of varying h for L=100
figure(20)
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


title('T(x) vs. x Numerical Solutions for L=100 and Varying h');
legend('h=0.01','h=0.1','1','5','10');
xlabel('x')
ylabel('(T(x)');










