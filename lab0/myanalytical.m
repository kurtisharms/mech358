%   Author: Kurtis Harms
%   Student #38764114
%   MECH 358 Lab 0
%   Purpose: Problem 2, computes the analytical solution for any given
%   time t as input, either as an individual point or a matrix of points.
%   Required Files: none
function yr = myanalytical(t)
    yr = -cos(t).*exp(-t.^3)+2.*exp(-t.^3);
end