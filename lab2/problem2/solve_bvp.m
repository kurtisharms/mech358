%   solve_bvp.m
%   Authors:    Kurtis Harms (38764114)
%               Ecem Kahraman (47962113)
%               Mike Wilk (21085121)
%   MECH 358 Lab 2
%   Purpose: Problem 2, a bvp solver function
%   Required Files: none
function T = solve_bvp(L,h,Pe,T_0,T_inf)
    N = (L-0)/h+1;
    A = diag(2.*ones(N,1)) + diag((ones(N-1,1).*(-1+(h/2)*Pe)),-1) + diag((ones(N-1,1).*(-1-(h/2)*Pe)),1);

    b = zeros(N,1);
    b(1) = T_0;
    b(N) = T_inf;
    
    % NOTE: the boundary conditions for solving this numerically were 
    %       done differently in lecture and then as presented in the
    %       lab 2 "hints" at the end. I am using the method presented in
    %       lecture (as shown above). The lecture method yeilds better
    %       results for larger values of h. The alternative method is shown
    %       below, but commented out.
    %b(1) = (1-(h/2)*Pe)*T_0;
    %b(N) = (1+(h/2)*Pe)*T_inf;

    T = A\b;
end