%   problem2.m
%   Authors:    Kurtis Harms (38764114)
%               Ecem Kahraman (47962113)
%               Mike Wilk (21085121)
%   MECH 358 Lab 3
%   Purpose: Problem 2
%   Required Files: none
clear;
clc;

L = 1;

% Initial and boundary conditions
T_x_0 = @(x) x/L;
T_0_t = @(t) 0.5.*sin(2.*pi.*t);
T_L_t = @(t) 1;

% x and t bounds
x_bounds = [0 L];
t_bounds = [0 10];

% values for k and h, time- and space-steps.
k = 0.001;
h = 0.1;

x = x_bounds(1):h:x_bounds(2);
t = t_bounds(1):k:t_bounds(2);

% We are defining i as rows, j as columns
w = meshgrid(x,t);

N = length(w(1,:));

A = diag((1-2.*k./h.^2).*ones(N,1)) + diag((k./h.^2).*ones(N-1,1),-1) + diag((k./h.^2).*ones(N-1,1),1);

w(1,:) = T_x_0(x);
w(:,1) = T_0_t(t_bounds(1));
w(:,end) = T_L_t(t_bounds(2));

S = @(i) 0;

for i = 1:(length(t))
    tmp = A*(w(i,:)');
    w(i+1,2:(length(w(1,:))-1)) = tmp(2:(length(w(1,:))-1)) + k*S(i);
end

% Store the values for t = 0, 0.05, 0.1, 0.2 and 1.0
T_stored = [ w(1,:); w(0.25/k+1,:); w(0.5/k+1,:); w(0.75/k+1,:); w(1.00/k+1,:); w(end,:) ];


plot(x,T_stored);
legend('t1','t2','t2','t3','t4');











