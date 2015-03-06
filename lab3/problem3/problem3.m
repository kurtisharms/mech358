%   problem3.m
%   Authors:    Kurtis Harms (38764114)
%               Ecem Kahraman (47962113)
%               Mike Wilk (21085121)
%   MECH 358 Lab 3
%   Purpose: Problem 3, truncation error for different schemes
%   Required Files: solve_bvp.m
clear;
clc;
format long;

%      .oooooo..o oooooooooooo ooooooooooooo ooooo     ooo ooooooooo.   
%     d8P'    `Y8 `888'     `8 8'   888   `8 `888'     `8' `888   `Y88. 
%     Y88bo.       888              888       888       8   888   .d88' 
%      `"Y8888o.   888oooo8         888       888       8   888ooo88P'  
%          `"Y88b  888    "         888       888       8   888         
%     oo     .d8P  888       o      888       `88.    .8'   888         
%     8""88888P'  o888ooooood8     o888o        `YbodP'    o888o        


h_values = [0.1,0.05,0.01,0.005];
% We are solving from 0 < x < 1
L = 1;

% Matrices of colors and lines widths
colors = ['r','b','k','g','y','m'];
linewidth = [1,1,1,1,1,2,1];

y0p5_exact = 0.2104196;
exact_values = y0p5_exact.*ones(length(h_values),1);

% Our boundary values
y_0 = 0;
y_L = 0;


%     ooooooooo.                          .              .o.       
%     `888   `Y88.                      .o8             .888.      
%      888   .d88'  .oooo.   oooo d8b .o888oo          .8"888.     
%      888ooo88P'  `P  )88b  `888""8P   888           .8' `888.    
%      888          .oP"888   888       888          .88ooo8888.   
%      888         d8(  888   888       888 .       .8'     `888.  
%     o888o        `Y888""8o d888b      "888"      o88o     o8888o

% Create and plot analytical solution
figure(1);
hold on;
% ezplot(@(x) exp(1).*x-x-exp(x)+1, [0 L]);
x = 0:0.0001:L;
y = exp(1).*x-x-exp(x)+1;
plot(x,y,'m','linewidth',linewidth(1));

error_values = ones(length(h_values),1);

% iterator for the inner loop
i = 1;
for h = h_values

    % Create and plot numerical solution
    y = solve_bvp(L,h,y_0,y_L);
    x = 0:h:L;
    plot(x,y,colors(i),'linewidth',linewidth(i));

    error_values(i) = y((length(y)+1)/2);
    % Increment the inner iterator
    i = i+1;
end

% Graph the solution for part (a)
% NOTE: this actually isn't required for the lab
legend('Analytical Solution', ...
'Numerical Solution with h=0.1', ...
'Numerical Solution with h=0.05', ...
'Numerical Solution with h=0.01', ...
'Numerical Solution with h=0.005');
title(strcat('T(x) vs. x Analytical & Numerical Solutions from 0 < x < L',num2str(L)));
xlabel('x')
ylabel('y(x)');

% Now prepare loglog plot for the error
figure(3);
hold on;
loglog(h_values,abs(error_values-exact_values)/abs(exact_values));
legend('Central Difference Method', ...
    '4th Order Difference Method');
title('Relative Error for Central Difference and 4th Order Difference vs. Mesh Size - Problem 3A/3B');
xlabel('h');
ylabel('Relative Error');
error_values_a = error_values;



% Show error values for each value of h
disp('Here are the error values using Central Differences:');
disp(error_values);
    
%     ooooooooo.                          .        oooooooooo.  
%     `888   `Y88.                      .o8        `888'   `Y8b 
%      888   .d88'  .oooo.   oooo d8b .o888oo       888     888 
%      888ooo88P'  `P  )88b  `888""8P   888         888oooo888' 
%      888          .oP"888   888       888         888    `88b 
%      888         d8(  888   888       888 .       888    .88P 
%     o888o        `Y888""8o d888b      "888"      o888bood8P'


figure(2);
hold on;
x = 0:0.0001:L;
y = exp(1).*x-x-exp(x)+1;
plot(x,y,'m','linewidth',linewidth(1));

error_values = ones(length(h_values),1);

% iterator for the inner loop
i = 1;
for h = h_values

    % Create and plot numerical solution
    y = solve_4th_order_part_b_bvp(L,h,y_0,y_L);
    x = 0:h:L;
    plot(x,y,colors(i),'linewidth',linewidth(i));

    error_values(i) = y((length(y)+1)/2);
    % Increment the inner iterator
    i = i+1;
end

% Graph the solution for part (b)
% NOTE: this actually isn't required for the lab
legend('Analytical Solution', ...
'Numerical Solution with h=0.1', ...
'Numerical Solution with h=0.05', ...
'Numerical Solution with h=0.01', ...
'Numerical Solution with h=0.005');
title(strcat('T(x) vs. x Analytical & Numerical Solutions from 0 < x < L',num2str(L)));
xlabel('x')
ylabel('y(x)');

% Add the loglog plot for the error of part (b)
figure(6);
loglog(h_values,abs(error_values-exact_values)/abs(exact_values),h_values,abs(error_values_a-exact_values)/abs(exact_values));

% Show error values for each value of h
disp('Here are the smaller error values using 4th-order BVP:');
disp(error_values);


%     ooooooooo.                          .          .oooooo.   
%     `888   `Y88.                      .o8         d8P'  `Y8b  
%      888   .d88'  .oooo.   oooo d8b .o888oo      888          
%      888ooo88P'  `P  )88b  `888""8P   888        888          
%      888          .oP"888   888       888        888          
%      888         d8(  888   888       888 .      `88b    ooo  
%     o888o        `Y888""8o d888b      "888"       `Y8bood8P' 

h_values = [0.25, 0.1, 0.05];
y_0 = 0;
y_L = 0;
y0p5_exact = -0.00490196320871196;
exact_values = y0p5_exact.*ones(length(h_values),1);
error_values = ones(length(h_values),1);

figure(4);
hold on;
% iterator for the inner loop
i = 1;
for h = h_values
    % Create and plot numerical solution
    y = solve_4th_order_part_c_bvp(L,h,y_0,y_L);
    x = 0:h:L;
    plot(x,y,colors(i),'linewidth',linewidth(i));

    error_values(i) = y((length(y)+1)/2);
    % Increment the inner iterator
    i = i+1;
end

legend('Numerical Solution with h=0.25', ...
'Numerical Solution with h=0.1', ...
'Numerical Solution with h=0.05');
title(strcat('y(x) vs. x Numerical Solutions for Part C from 0 < x < L',num2str(L)));
xlabel('x')
ylabel('y(x)');

% Now prepare loglog plot for Part C
figure(5);
hold on;
loglog(h_values,abs(error_values-exact_values)/abs(exact_values));
legend('4th-order Difference Method');
title('Relative Error for 4th Order Difference for Problem 3C');
xlabel('h');
ylabel('Relative Error');


% Show error values for each value of h
disp('Here are the error values using 4th-order BVP on -y"=sqrt(x)*sin(10x):');
disp(error_values);












