%   compareeulermidpointode45.m
%   Author: Kurtis Harms
%   Student #38764114
%   MECH 358 Lab 0
%   Purpose: Problem 2, compare euler, midpoint and ode45 methods to
%   analytical method
%   Required Files: testfunction.m, calceuler.m, calcmidpoint.m,
%   myanalytical.m
clear all;

figure(1);
hold on;
figure(2);
hold on;

h = 0.1;
t_interval = [0,1];
y0 = 1;

t_analytical = linspace(0,1,1000);

% The analytical solution
y_analytical = myanalytical(t_analytical);

% Plot the analytical solution
figure(1);
plot(t_analytical,y_analytical);

[t,y] = calceuler(t_interval,@testfunction,h,y0);
% Plot the Euler solution
figure(1);
plot(t,y,'--r','LineWidth',2);
% Plot the Euler absolute error
figure(2);
plot(t,abs(y-myanalytical(t)),'--r','LineWidth',2);


[t,y] = calcmidpoint(t_interval,@testfunction,h,y0);
% Plot the Midpoint Solution
figure(1);
plot(t,y,':k','LineWidth',2);
% Plot the Midpoint absolute error
figure(2);
plot(t,abs(y-myanalytical(t)),':k','LineWidth',2);

[t,y] = ode45(@testfunction, t_interval, y0);
% Plot the ODE45 Solution
figure(1);
plot(t,y,'m','LineWidth',1);
% Plot the ODE45 absolute error
figure(2);
plot(t,abs(y-myanalytical(t)),'m','LineWidth',1);

% Add labels for figure 1
figure(1);
xlabel('t [s]');
ylabel('y(t)');
title('y(t) plotted with Analytical, Euler, Midpoint & ODE45 Solutions');
legend('Analytical Solution','Euler Solution','Midpoint Solution','ODE45 Solution');

% Add labels for figure 2
figure(2);
xlabel('t [s]');
ylabel('Absolute Error');
title('Absolute error for Euler, Midpoint and ODE45');
legend('Euler Absolute Error','Midpoint Absolute Error','ODE45 Absolute Error');
