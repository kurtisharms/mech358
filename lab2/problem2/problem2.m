%   problem2.m
%   Author: Kurtis Harms
%   Student #38764114
%   MECH 358 Lab 2
%   Purpose: Problem 2, a convenctive heat transfer problem
%   Required Files: none
clear;
clc;

Pe_values = 1;
h_values = [1];
L_values = [10];

h = 1;
Pe =1;
L = 10;

N = (L-0)/h;

T_inf = 0;
T_0 = 1;



A = diag(2.*ones(N,1))+diag(ones(N-1,1).*(-1+(h/2)*Pe),-1)+diag(ones(N-1,1).*(-1-(h/2)*Pe),1)

b = zeros(N,1);
b(1) = 1-(h/2)*Pe;
b(N) = 1-