%   solve_4th_order_part_c_bvp.m
%   Authors:    Kurtis Harms (38764114)
%               Ecem Kahraman (47962113)
%               Mike Wilk (21085121)
%   MECH 358 Lab 3
%   Purpose: Problem 3, a 4th-order bvp solver function for part c
%   Required Files: none
function y = solve_4th_order_part_c_bvp(L,h)
    x = 0:h:L;
    N = length(x);
    A = diag(-2.*ones(N,1)) + diag(1.*ones(N-1,1),-1) + diag(1.*ones(N-1,1),1);
    B = diag(-10.*ones(N,1)) + diag(-1.*ones(N-1,1),-1) + diag(-1.*ones(N-1,1),1);
    B = (h.^2)./12.*B;
    
    % Modify the first and last rows to obtain the right matrix
    A(1,1) = 1;
    A(end,end) = 1;
    A(1,2) = 0;
    A(end,end-1) = 0;
    B(1,:) = 0; 
    B(end,:) = 0;

    % Function for f
    f = (sqrt(x).*sin(10.*x))';

    y = A\(B*f);
end