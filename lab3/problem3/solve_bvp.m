%   solve_bvp.m
%   Authors:    Kurtis Harms (38764114)
%               Ecem Kahraman (47962113)
%               Mike Wilk (21085121)
%   MECH 358 Lab 3
%   Purpose: Problem 3, a bvp solver function
%   Required Files: none
function T = solve_bvp(L,h,T_0,T_L,ri)
    N = (L-0)/h+1;
    
    % Our equation is in the form of -y"=r(x)
    % where r(x) = exp(x)
    A = diag(-2.*ones(N,1)) + diag(1.*ones(N-1,1),-1) + diag(1.*ones(N-1,1),1);

    b = -(h.^2).*exp((0:h:L)');
    b(1) = b(1) - T_0;
    b(N) = b(N) - T_L;
    
    hold on;
    T = A\b;
end