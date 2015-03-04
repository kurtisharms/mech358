% .m file: testfunction.m

clear all; clc;

h=1; % time steps
x = -3:0.001:3; % for newfunction
% x = 0:0.001:10; % length x = 1001 at time interval 0.01

for i = 1:length(x) % from 1 to 1000, for loop puts each individual value into function
    y(i) = newfunction(x(i)); % for new function
    dy(i) = 2.*x(i) - 1; % derivative of newfunction
    
%     y(i)= testfunction(x(i)); % length y = 1000
%     dy(i) = 0.5.*(x(i).^(-0.5))*cos(sqrt(x(i))); % analytical derivative fnc1
end

for i = 2:(length(x)-2) % for central case and 2nd derivative   

    dydx(i)=(y(i+1)-y(i-1))/h; % derivative for the central case

end

for i = 2:(length(x)-2)
    
   error(i) = dydx(i) - dy(i); 
   
end

%plot(x(1:length(x)),y)
%plot(x(1:length(x)),dy,'y','linewidth',8)
hold on;
% plot(x(1:length(x)-1),dydx)

%plot(x(1:length(x)),dy,'y','linewidth',8); % plot analytical derivative
%plot(x(1:length(x)-2),dydx,'k--') % h = 0.001
%plot(x(1:length(x)-2),dydx,'g:') % h = 0.01
%plot(x(1:length(x)-2),dydx,'m-.') % h = 0.1
%plot(x(1:length(x)-2),dydx,'b') % h = 1
%xlim([0 7])
%hold on;

%Plotting dydx vs x including analytical solution
% legend('analytical','dydx@h=0.001','dydx@h=0.01','dydx@h=0.1','dydx@h=1');
% xlabel('x');
% ylabel('dydx');
% title('dydx vs x, central case, problem 1, lab 2, function 2');

%plot(x(1:(length(x)-2)),abs(error),'y','linewidth',8); % h = 0.001
%plot(x(1:(length(x)-2)),abs(error),'g:'); % h = 0.01
%plot(x(1:(length(x)-2)),abs(error),'m-'); % h = 0.1
%plot(x(1:(length(x)-2)),abs(error),'k--'); % h = 1
% xlim([-3 3])
% xlim([0 1])
% ylim([-4 5])
% hold on;

%Plotting the error vs x
legend('h=0.001','h=0.01','h=0.1','h=1');
xlabel('x');
ylabel('error');
title('error vs x, central case, problem 1, lab 2, function 2');
