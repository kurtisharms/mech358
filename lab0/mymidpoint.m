%   mymidpoint.m
%   Author: Kurtis Harms
%   Student #38764114
%   MECH 358 Lab 0
%   Purpose: Problem 2, calculates testfunction using the midpoint method
%   Required Files: testfunction.m, calcmidpoint.m
clear all;
format long;

% INPUT
% Timestep
h = 0.1;
t_interval = [0 1];
y0 = 1;

% Call the calcmidpoint function
[t,y] = calcmidpoint(t_interval,@testfunction,h,y0);

% Check to make sure that this matches the accuracy we need
if abs(y(end)-0.53518) <= 0.5E-5
    disp('Correctly produces the approximation y(1) = 0.53518');
else
    disp('Error! Does not produce the approximation y(1) = 0.53518')
end

