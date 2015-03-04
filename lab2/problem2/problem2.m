%   problem2.m
%   Authors:    Kurtis Harms (38764114)
%               Ecem Kahraman (47962113)
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
colors = ['r','b','k','g','y','m'];
linewidth = [1,1,1,1,1,2,1];

% Our boundary values, correspondint to T(0) and T(infinity)
T_bvs = [1 0];

i = 1;
for L = L_values 

    % We are creating a different figure for each value of L
    figure(i);
    hold on;
    

    
    % Create and plot analytical solution
    x = 0:0.0001:L;
    y = exp(-Pe.*x);
    plot(x,y,'m','linewidth',linewidth(i));

    % iterator for the inner loop
    j = 1;
    for h = h_values

        % Create and plot numerical solution
        T = solve_bvp(L,h,Pe,T_bvs(1),T_bvs(2));
        x = 0:h:L;
        plot(x,T,colors(j),'linewidth',linewidth(j));
        
        % Increment the inner iterator
        j = j+1;
    end
    
    legend('Analytical Solution', ...
    'Numerical Solution with h=0.1', ...
    'Numerical Solution with h=1');
    title(strcat('T(x) vs. x Analytical & Numerical Solutions for Pe=1 and L=',num2str(L)));
    xlabel('x')
    ylabel('T(x)');
    
    % Increment the outer iterator
    i = i+1;
end


% Create a new figure for the plot of varying h for L=100
figure(20)
hold on;

clear x T h y; 
Pe = 1;
i = 1;
% Use a constant L value of L=100
L = 100;
T_bvs = [1 0];
% Increase the number of h values we are testing
h_values = [0.01,0.1,1,5,10];

% Plot the analytical solution
x = 0:0.0001:L;
y = exp(-Pe.*x);
plot(x,y,colors(i),'linewidth',linewidth(i));

for h = h_values
    i = i+1;
    % Solve using our foundary conditions, Pe, L and varying h
    T = solve_bvp(L,h,Pe,T_bvs(1),T_bvs(2));

    x = 0:h:L;
    plot(x,T,colors(i),'linewidth',linewidth(i));
end

title('T(x) vs. x Analytical & Numerical Solutions for Pe=1, L=100 and Varying h');
legend('Analytical Solution','h=0.01','h=0.1','h=1','h=5','h=10');
xlabel('x')
ylabel('(T(x)');










