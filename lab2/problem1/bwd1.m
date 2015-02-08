% Mike Wilk 21085121
% Ecem 
% Curtis
% .m file: testfunction.m

h=0.01; % time steps

x = 0:h:10; % length x = 1001 at time interval 0.01

for i = 1:length(x)-1 % from 1 to 1000, for loop puts each individual value into function
    
    y(i)= testfunction(x(i)); % length y = 1000
    dy(i) = 0.5*(x(i)^(-0.5))*cos(sqrt(x(i))); % analytical derivative for plotting error
    
end


for i = 2:(length(x)-1) % for backward case
    
    dydx(i)=(y(i)-y(i-1))/h; % derivative for the BACKWARD case --> works

end


plot(x(1:length(x)-1),dydx) % for backward case