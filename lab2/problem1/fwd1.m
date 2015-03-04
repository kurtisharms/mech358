% Mike Wilk, 21085121
% 
% .m file: testfunction.m

% Analytical solution
% f(x) = sin(x^(1/2))
% f'(x) = 0.5 * x^(-1/2) * cos(x^(1/2))
% f''(x) = -1/(4x) * sin(x^(1/2)) - 1/(4x^(3/2)) * cos(x^(1/2))

clear all; clc;
% h = 1; 0:1; 0:01; 0:001;
h=1; % time steps
x = -3:h:3; % for newfunction
%x = 0:h:10; % for testfunction - vector of x points

for i = 1:length(x) % from 1 to 1000, for loop puts each individual value into function
    
    y(i) = newfunction(x(i)); % for new function
    dy(i) = 2.*x(i) - 1; % derivative of newfunction
%     y(i)= testfunction(x(i)); % length y = 1000
%     dy(i) = 0.5*(x(i).^(-0.5))*cos(sqrt(x(i))); % analytical derivative for plotting error
    
end

%y = testfunction(x); % i think this works fine too
 
for i = 1:(length(x)-1) % for forward case --> i = 1:(length(x)-2)for testfunction

   dydx(i)=(y(i+1)-y(i))/h; % derivative for the FORWARD case w/Dan

end

% for i=1:(length(x)-2)
for i = 1:(length(x)-2)
    
   error(i) = dydx(i) - dy(i); % error(301) is messed up besause dy has 0 in denominator at error(301)
   
end

% plot(x,dy,'k*'); % plot analytical derivative, USED THIS ONE
% hold on;
%xlim([0 4])

plot(x(1:(length(x)-2)),error); % error plot GOOD
%plot(x(2:length(x)-1),error) % plots the error for testfunction error only since newfunction derivative has a discontinuity at x=0
%plot(x(2:(length(x)-300)),error(2:(length(x)-300))); % for newfunction
hold on;
%plot(x(1:(length(x)-300)), dy(1:(length(x)-300))); % for newfunction
%hold on;

%plot(x(1:length(x)-1),y); % plots x vs y for testfunction
% hold on;
% plot(x(1:length(x)-1),dydx); % for forward case for testfunction, USED THIS ONE
% hold on;
% ylim([-10 10]); % sets the minimum and maximums for the y-axis

%plot(x(1:length(x)),y); % for newfunction

%plot(x(1:(length(x)+1)/2-1), dy(1:(length(x)+1)/2-1));%for newfunction -3<x<0 for x vs dy
% hold on; % above plot finds the x=0 point of all h timesteps
% plot(x(((length(x)+1)/2+1):601), dy(((length(x)+1)/2+1):601));%for newfunction 0<x<-3 for x vs dy
% these two plots show a very small error from -3<x<0 with h = 0.01
% plot(x,dy); % turns out I can just do this, fuck my life and the last wasted hour
% hold on;

%Plotting dydx vs x including analytical solution
% legend('analytical','dydx@h=0.001','dydx@h=0.01','dydx@h=0.1','dydx@h=1');
% xlabel('x');
% ylabel('dydx');
% title('dydx vs x, forward case, problem 1, lab 2, function 2');

%Plotting the error vs x
legend('h=0.001','h=0.01','h=0.1','h=1');
xlabel('x');
ylabel('error');
title('error vs x, forward case, problem 1, lab 2, function 1');
