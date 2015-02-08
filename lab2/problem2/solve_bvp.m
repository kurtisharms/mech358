%   solve_bvp.m
%   Author: Kurtis Harms
%   Student #38764114
%   MECH 358 Lab 2
%   Purpose: Problem 2, a bvp solver function
%   Required Files: none
function [T] = solve_bvp(L,h,Pe,T_0,T_inf)
    N = (L-0)/h+1;
    A = diag(2.*ones(N,1)) + diag((ones(N-1,1).*(-1+(h/2)*Pe)),-1) + diag((ones(N-1,1).*(-1-(h/2)*Pe)),1);

    b = zeros(N,1);
    b(1) = (1-(h/2)*Pe)*T_0;
    b(N) = (1-(h/2)*Pe)*T_inf;

    [T] = A\b;
end