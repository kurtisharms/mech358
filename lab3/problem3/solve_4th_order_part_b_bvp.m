%   solve_4th_order_part_b_bvp.m
%   Authors:    Kurtis Harms (38764114)
%               Ecem Kahraman (47962113)
%               Mike Wilk (21085121)
%   MECH 358 Lab 3
%   Purpose: Problem 3, a 4th-order bvp solver function for part b
%   Required Files: none
function y = solve_4th_order_part_b_bvp(L,h,y_0,y_L)
    N = length(0:h:L);


    A = diag(-2.*ones(N,1)) + diag(1.*ones(N-1,1),-1) + diag(1.*ones(N-1,1),1);
    B = diag(-10.*ones(N,1)) + diag(-1.*ones(N-1,1),-1) + diag(-1.*ones(N-1,1),1);
    B = (h.^2)./12.*B;
    
    % Modify the first and last rows
    A(1,1) = 1;
    A(end,end) = 1;
    A(1,2) = 0;
    A(end,end-1) = 0;
    
    B(1,:) = 0; 
    B(end,:) = 0;
    

    f = (exp(0:h:L))';

    y = A\(B*f);
end