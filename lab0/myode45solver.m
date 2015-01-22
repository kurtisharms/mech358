%   Author: Kurtis Harms
%   Student #38764114
%   MECH 358 Lab 0
%   Purpose: Problem 1
%   Required Files:
clear all;
format long;

% INPUT
% Timestep
h = 0.1;
t_interval = [0 1];
y0 = 1;



[t,y] = ode45(@testfunction, t_interval, y0);