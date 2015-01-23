%   Author: Kurtis Harms
%   Student #38764114
%   MECH 358 Lab 0
%   Purpose: Problem 2, calculates y' of the function for any given input t
%   Required Files: none

function ypi = testfunction(t,y)
    ypi = (-3)*(t^2)*y+sin(t)*exp(-(t^3));
end