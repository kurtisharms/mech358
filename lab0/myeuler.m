%   Author: Kurtis Harms
%   Student #38764114
%   MECH 358 Lab 0
%   Purpose: Problem 2, call euler function to solve testfunction
%   Required Files: testfunction.m, calceuler.m
clear all;
format long;

% INPUT
% Timestep
h = 0.1;
t_interval = [0 1];
y0 = 1;

% Call the function calceuler to calculate
[t,y] = calceuler(t_interval,@testfunction,h,y0);






