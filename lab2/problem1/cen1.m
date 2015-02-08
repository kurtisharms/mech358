% .m file: testfunction.m

clear all; clc;


h=0.01; % time steps

x = 0:h:10; % length x = 1001 at time interval 0.01

for i = 1:length(x) % from 1 to 1000, for loop puts each individual value into function
    y(i)= testfunction(x(i)); % length y = 1000
    dy(i) = 0.5*(x(i)^(-0.5))*cos(sqrt(x(i))); % analytical derivative for plotting error
end


for i = 2:(length(x)-2) % for central case and 2nd derivative   

    dydx(i)=(y(i+1)-y(i-1))/h; % derivative for the central case

end

plot(x(1:length(x)),y)
hold on;
plot(x(1:length(x)-2),dydx) % for centrals