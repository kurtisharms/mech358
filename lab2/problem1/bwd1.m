% Mike Wilk 21085121
% Ecem 
% Curtis
% .m file: testfunction.m

clear all; clc;
h = 1; % time steps
x = -3:h:3; % for newfunction
%x = 0:h:10; % length x = 1001 at time interval 0.01
counter = 0;
%for i = 1:length(x)-1 % from 1 to 1000, for loop puts each individual value into function
 for i = 2:length(x)  
     counter = counter + 1;
    y(counter) = newfunction(x(i)); % for new function
    %dy(i) = 2.*x(i) - 1; % derivative of newfunction
    %y(i)= testfunction(x(i)); % length y = 1000
    %dy(i) = 0.5.*(x(i).^(-0.5))*cos(sqrt(x(i))); % derivative fnc1
    
end
counter = 0;

for i = 2:(length(x)-1) % for backward case
    counter = counter + 1;
    dy(counter) = 2.*x(i) - 1; % analytical derivative of newfunction
    dydx(counter)=(y(i)-y(i-1))./h; % derivative for the BACKWARD case --> works
%     dy(i) = 2.*x(i) - 1; % analytical derivative of newfunction
%     dydx(i)=(y(i)-y(i-1))./h; % derivative for the BACKWARD case --> works

end

counter=0;
for i = 2:(length(x)-2)
        counter = counter + 1;

   error(counter) = dydx(i) - dy(i); 
   
end
%plot(x(1:(length(x)-1),dy)
%plot(x(1:length(x)-1),y)
% plot(x(1:length(x)-2),dy,'r','linewidth',8)
% figure
% plot(x(1:length(x)-2),dydx,'g','linewidth',8)
%hold on;
% figure
% plot(x(1:length(x)-1),dydx)

%plot(x(1:length(x)-1),dy,'y','linewidth',8); % plot analytical derivative
%plot(x(1:length(x)-1),dydx,'k--') % h = 0.001
%plot(x(1:length(x)-1),dydx,'g:') % h = 0.01
%plot(x(1:length(x)-1),dydx,'m-.') % h = 0.1
%plot(x(1:length(x)-1),dydx,'b.') % h = 1
%xlim([0 3])
% hold on;

%Plotting dydx vs x including analytical solution
% legend('analytical','dydx@h=0.001','dydx@h=0.01','dydx@h=0.1','dydx@h=1');
% xlabel('x');
% ylabel('dydx');
% title('dydx vs x, backward case, problem 1, lab 2, function 2');

%plot(x(2:(length(x)-2)),abs(error),'y','linewidth',8); % h = 0.001
%plot(x(2:(length(x)-2)),abs(error),'g:'); % h = 0.01
%plot(x(2:(length(x)-2)),abs(error),'m-'); % h = 0.1
plot(x(2:(length(x)-2)),abs(error),'k--'); % h = 1
% xlim([-3 3])
%ylim([0 0.1])
hold on;

%Plotting the error vs x
legend('h=0.001','h=0.01','h=0.1','h=1');
xlabel('x');
ylabel('error');
title('error vs x, backward case, problem 1, lab 2, function 2');
