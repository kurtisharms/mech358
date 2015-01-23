%   problem1.m
%   Author: Kurtis Harms
%   Student #38764114
%   MECH 358 Lab 0
%   Purpose: Problem 1
%   Required Files: problem1odefunc.m
clear all;
% declare a global n to share between files
global n;

% all of our possible values for n
n_values = [1,5,9,15];
% time domain
t_interval = [0,20];
% initial values for u, and u' respectively
x_init = [0,1];

% The analytical solution is u(t)=sin(t)
t = linspace(t_interval(1),t_interval(2),10000);
u = sin(t);
figure(1);
plot(t,u);

n = 1;
hold on;
[t,y] = ode45(@problem1odefunc, t_interval, x_init);
plot(t,y(:,1),'-g')
xlabel('t [s]');
ylabel('u(t)');
legend('Analytical Solution','Numerical Solution');
title('Problem 1.1: Analytical and Numerical Solution with n=1');

figure(2);
hold on;
colors = ['r','b','g','k'];  
i = 1;
   

for n = n_values 
    [t,y] = ode45(@problem1odefunc, t_interval, x_init);
    plot(t,y(:,1),colors(i))
    i = i+1;
end

xlabel('t [s]');
ylabel('u(t)');
legend('u(t) with n=1','u(t) with n=5','u(t) with n=9','u(t) with n=15');
title('u(t) with n=1,5,9,15');


% Part 3
figure(3);
hold on;
colors = ['r','b','g','k'];  
i = 1;
   

for n = n_values 
    [t,y] = ode45(@problem1odefunc, t_interval, x_init);
    energy = 0.5.*(y(:,2).^2)+(y(:,1).^(n+1))/(n+1);
    plot(t,energy,colors(i))
    i = i+1;
end

xlabel('t [s]');
ylabel('energy(t)');
legend('energy with n=1','energy with n=5','energy with n=9','energy with n=15');
title('Energy vs. Time with n=1,5,9,15');











