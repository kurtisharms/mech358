%   problem1odefunc.m
%   Author: Kurtis Harms
%   Student #38764114
%   MECH 358 Lab 0
%   Purpose: Problem 1
%   Required Files: none
function yp = program1odefunc(t,y)
    global n;
    yp = [y(2);-(y(1)^n)];
end