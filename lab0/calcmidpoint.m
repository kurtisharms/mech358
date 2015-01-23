%   Author: Kurtis Harms
%   Student #38764114
%   MECH 358 Lab 0
%   Purpose: Problem 2, test various timesteps of h
%   Required Files: none
function [t,y] = calcmidpoint(t_interval,func,h,y0)
    N = (t_interval(2) - t_interval(1))/h;
    t = linspace(t_interval(1),t_interval(2),N+1)';
    y = zeros(N,1);
    y(1) = y0;

    for i = 1:(size(t,1)-1)
        y(i+1) = y(i) + h*func(t(i)+h/2,y(i)+h/2*func(t(i),y(i)));
    end
end
