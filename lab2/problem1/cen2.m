% .m file: testfunction.m
% f''(x) = -1/(4x) * sin(x^(1/2)) - 1/(4x^(3/2)) * cos(x^(1/2))

clear all; clc;


h=0.01; % time steps

x = 0:h:10; % length x = 1001 at time interval 0.01
for i = 1:length(x) % from 1 to 1000, for loop puts each individual value into function
    y(i)= testfunction(x(i)); % length y = 1000
    dy(i) = 0.5*(x(i)^(-0.5))*cos(sqrt(x(i))); % analytical derivative for plotting error
    dy2(i) = -1/(4x(i)) * sin(x(i)^(1/2)) - 1/(4x(i)^(3/2)) * cos(x(i)^(1/2));

end
 
for i = 2:(length(x)-2) % for central case and 2nd derivative 
    
d2ydx2(i)=(y(i+1)-2.*y(i)+y(i-1))./(h.^2); % 2nd derivative for central

end

plot(x(1:length(x)),y)
hold on;
plot(x(1:length(x)-2),d2ydx2) % for centrals