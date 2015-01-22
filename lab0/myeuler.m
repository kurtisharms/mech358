%   Author: Kurtis Harms
%   Student #38764114
%   MECH 358 Lab 0
%   Purpose: Problem 2
%   Required Files:
clear all;
format long;

% INPUT
% Timestep
h = 0.1;
t = [0 1];
y0 = 1;

% CALCULATED VALUES

N = (t(2) - t(1))/h;
t = linspace(t(1),t(2),N+1)';
y = zeros(N,1);
y(1) = y0;

for i = 1:(size(t,1)-1)
    y(i+1) = y(i) + h*testfunction(t(i),y(i));
end





