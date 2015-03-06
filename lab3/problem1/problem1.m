%   problem1.m
%   Authors:    Kurtis Harms (38764114)
%               Ecem Kahraman (47962113)
%               Mike Wilk (21085121)
%   MECH 358 Lab 3
%   Purpose: Problem 1
%   Required Files: none
clear;
clc;

% Initial and boundary conditions
T_x_0 = @(x) x.*(1-x);
T_0_t = 0;
T_L_t = 0;

% x and t bounds
x_bounds = [0 1];
t_bounds = [0 1];

% values for k and h, time- and space-steps.
k = 0.1;
h = 0.1;

N = (x_bounds(2)-x_bounds(1))/h+1;

x = x_bounds(1):h:x_bounds(2);

% We are defining i as rows, j as columns
w = meshgrid(x_bounds(1):h:x_bounds(2),t_bounds(1):k:t_bounds(2));

w(1,:) = T_x_0(x_bounds(1):h:x_bounds(2));

N = length(w(1,:));

A = diag((1-2.*k./h.^2).*ones(N,1)) + diag((k./h.^2).*ones(N-1,1),-1) + diag((k./h.^2).*ones(N-1,1),1);

w(:,1) = 0;
w(:,end) = 0;

for i = 1:(length(w(:,1)))
    tmp = A*(w(i,:)');
    w(i+1,2:(length(w(1,:))-1)) = tmp(2:(length(w(1,:))-1));
end

figure(1);
hold on;
% Store the values for t = 0, 0.05, 0.1, 0.2 and 1.0
T_stored = [ w(1,:); w(0.05/k+1,:); w(0.1/k+1,:); w(0.2/k+1,:); w(end,:) ];
plot(x,T_stored);


% For solving the exact solution, we have a Dirichlet BC
t = [0,0.05,0.1,0.2,1]; % time points to extract from analytical solution
u = zeros(length(x),5); % u is a function of x & t ie) u(x,t)

for n = 1:100 % for loop creating the analytical solution
    for k = 1:length(t)     
      u(:,k) = u(:,k)' + 4*(1 -cos(n*pi))/((n*pi)^3) .* sin(n.*pi.*x) .* exp(-t(k).*(n*pi)^2);
    end
end

plot(x,u,'*');

legend('t=0 numerical', ...
    't=0.05 numerical', ...
    't=0.1 numerical', ...
    't=0.2 numerical', ...
    't=1.0 numerical', ...
    't=0 analytical', ...
    't=0.05 analytical', ...
    't=0.1 analytical', ...
    't=0.2 analytical', ...
    't=1.0 analytical');
title('Numerical and Analytical Solutions for Problem 1');
xlabel('x');
ylabel('T');













