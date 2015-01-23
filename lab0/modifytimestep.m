%   modifytimestep.m
%   Author: Kurtis Harms
%   Student #38764114
%   MECH 358 Lab 0
%   Purpose: Problem 2, test various timesteps of h
%   Required Files: calceuler.m, calcmidpoint.m, myanalytical.m,
%   testfunction.m

h_values = [0.2,0.1,0.05,0.025,0.0125];

colors = ['--r','g','b','--k','y'];

t_interval = [0,1];
y0 = 1;
% We will store the error for the five values of 5 in a matrix
error_values = zeros(5,1);

% Set figures which are iteratively plotted on to 'hold on'
figure(1);
hold on;
figure(2); 
hold on;
figure(4);
hold on;
figure(5);
hold on;

%
% EULER Calculations for varying h
%
figure(1);
i = 1;

for h = h_values
    [t,y] = calceuler(t_interval,@testfunction,h,y0);
    
    % Plot Euler
    figure(1);
    plot(t,y,colors(i));
    %  Plot Euler Absolute Error
    figure(2);
    plot(t,abs(y-myanalytical(t)),colors(i));
    % Find the error for h at t = 1, and store it
    error_values(i) = abs(myanalytical(t(end))-y(end));
    
    i = i + 1;
end

% Label Euler Plot
figure(1);
xlabel('t [s]');
ylabel('y(t) with Euler');
legend('h=0.2','h=0.1','h=0.05','h=0.025','h=0.0125');
title('Euler Method with varying h');

% Label Euler Absolute Error for varying h
figure(2);
xlabel('t [s]');
ylabel('Absolute Error');
legend('h=0.2','h=0.1','h=0.05','h=0.025','h=0.0125');
title('Euler Method Absolute Error vs. t for varying h');

% Plot Euler absolute error as a function of h at t=1
figure(3);
plot(h_values,error_values);
xlabel('h');
ylabel('Absolute Error');
legend('Absolute Error at t=1');
title('Abslolute Error vs. h for Euler Method at t=1');


%
% MIDPOINT Calculations for varying h
%
i = 1;

for h = h_values
    [t,y] = calcmidpoint(t_interval,@testfunction,h,y0);
    
    % Plot Midpoint
    figure(4);
    plot(t,y,colors(i));
    % Plot Midpoint Absolute Error
    figure(5);
    plot(t,abs(y-myanalytical(t)),colors(i));
    % Find the error for h at t = 1, and store it
    error_values(i) = abs(myanalytical(t(end))-y(end));
    i = i + 1;
end

% Label Midpoint Plot
figure(4);
xlabel('t [s]');
ylabel('y(t) with Midpoint');
legend('h=0.2','h=0.1','h=0.05','h=0.025','h=0.0125');
title('Midpoint Method with varying h');

% Label Midpoint Absolute Error for varying h
figure(5);
xlabel('t [s]');
ylabel('Absolute Error');
legend('h=0.2','h=0.1','h=0.05','h=0.025','h=0.0125');
title('Midpoint Method Absolute Error vs. t for varying h');

% Plot Midpoint absolute error as a function of h at t=1
figure(6);
plot(h_values,error_values);
xlabel('h');
ylabel('Absolute Error');
legend('Absolute Error at t=1');
title('Abslolute Error vs. h for Midpoint Method at t=1');

