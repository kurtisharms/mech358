%   Author: Kurtis Harms
%   Student #38764114
%   MECH 358 Lab 0
%   Purpose: Problem 2
%   Required Files:

function ypi = testfunction(t,y)
    ypi = (-3)*(t^2)*y+sin(t)*exp(-(t^3));
end