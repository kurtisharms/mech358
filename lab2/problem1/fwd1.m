% Mike Wilk, 21085121
% 
% .m file: testfunction.m

% Analytical solution
% f(x) = sin(x^(1/2))
% f'(x) = 0.5 * x^(-1/2) * cos(x^(1/2))
% f''(x) = -1/(4x) * sin(x^(1/2)) - 1/(4x^(3/2)) * cos(x^(1/2))

clear all; clc;


h=0.01; % time steps

x = 0:h:10; % length x = 1001 at time interval 0.01

for i = 2:length(x) % from 1 to 1000, for loop puts each individual value into function
    
    y(i)= testfunction(x(i)); % length y = 1000
    dy(i) = 0.5*(x(i)^(-0.5))*cos(sqrt(x(i))); % analytical derivative for plotting error
    
end

%y = testfunction(x);
 
for i = 1:(length(x)-2) % for forward case

dydx(i)=(y(i+1)-y(i))/h; % derivative for the FORWARD case w/Dan

end

for i = 2:(length(x)-2)
    
   error(i) = dydx(i) - dy(i); 
   
end

plot(x(2:length(x)-1),error) % plots the error
hold on;
% plot(x(1:length(x)-1),y) % plots x vs y
% hold on;
% plot(x(1:length(x)-2),dydx) % for forward case
