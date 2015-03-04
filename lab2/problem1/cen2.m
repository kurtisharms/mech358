% .m file: testfunction.m
% f''(x) = -1/(4x) * sin(x^(1/2)) - 1/(4x^(3/2)) * cos(x^(1/2))

clear all; clc;


h=1; % time steps
x = -3:h:3; % for newfunction
%x = 0:h:10; % length x = 1001 at time interval 0.01

for i = 1:length(x) % from 1 to 1000, for loop puts each individual value into function
    y(i) = newfunction(x(i)); % for new function
    %dy(i) = 
    dy2(i) = 2;
    
%     y(i)= testfunction(x(i)); % length y = 1000
    %dy(i) = 0.5.*(x(i)^(-0.5))*cos(sqrt(x(i))); % analytical derivative for plotting error
%     dy2(i) = -1/(4.*x(i)) * sin(x(i).^(1/2)) - 1/(4*x(i).^(3/2)) * cos(x(i).^(1/2));

end
 
for i = 2:(length(x)-2) % for central case and 2nd derivative 
    
d2ydx2(i)=(y(i+1)-2.*y(i)+y(i-1))./(h.^2); % 2nd derivative for central

end

for i = 2:(length(x)-2)
    
   error(i) = d2ydx2(i) - dy2(i); 
   
end

% plot(x(1:length(x)),y);
% plot(x(1:length(x)),(dy2),'y','linewidth',8)
hold on;
% plot(x(1:length(x)-1),dydx)

%plot(x(1:length(x)),abs(dy2),'y','linewidth',8); % plot analytical derivative
%plot(x(1:length(x)-2),abs(d2ydx2),'k--') % h = 0.001
%plot(x(1:length(x)-2),abs(d2ydx2),'g:') % h = 0.01
%plot(x(1:length(x)-2),abs(d2ydx2),'m-.') % h = 0.1
%plot(x(1:length(x)-2),abs(d2ydx2),'b') % h = 1
% xlim([0 2.5])

%Plotting dydx vs x including analytical solution
% legend('analytical','d2ydx2@h=0.001','d2ydx2@h=0.01','d2ydx2@h=0.1','d2ydx2@h=1');
% xlabel('x');
% ylabel('dydx');
% title('abs(d2ydx2) vs x, central case 2, problem 1, lab 2, function 2');

%plot(x(1:(length(x)-2)),abs(error),'y','linewidth',8); % h = 0.001
%plot(x(1:(length(x)-2)),abs(error),'g:'); % h = 0.01
%plot(x(1:(length(x)-2)),abs(error),'m-'); % h = 0.1
%plot(x(1:(length(x)-2)),abs(error),'k--'); % h = 1
% xlim([-3 3])
% xlim([0 1])
ylim([-1 1])

%Plotting the error vs x
legend('h=0.001','h=0.01','h=0.1','h=1');
xlabel('x');
ylabel('error');
title('error(d2ydx2) vs x, central case 2, problem 1, lab 2, function 2');


