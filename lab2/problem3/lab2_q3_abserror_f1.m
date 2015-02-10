%Ecem Kahraman, 47962113
%Purpose:  Computing and plotting the error in Fourier series for the first 
%function f(x)=abs(x) for x=[-2,2] 

clear all

format long
color=['r','b','m','g']

x=linspace(-2,2,200)


%N values given for finding the first N nonzero terms of this series
N=[5 10 30 100]

%a_0 value found analytically = 1
a_0=1;

for j = 1:length(N)
    
    partialsum=0;
    
    %Even function so no b_n terms
    for n=1:2:N(j)
        partialsum=partialsum+((-8/((pi*n).^2))*cos((n*pi*x)/2));
        
    end
    
    %Finding the total partial sum with a_0 value added
    SN=partialsum+a_0;
    
    F1=abs(x);
    abserr=abs(SN-F1);
    % relerr=abserr/F1;
    
    hold on 
    
    plot(x,abserr,color(j),'Linewidth',2)
    title('Absolute error in Nth partial sum of Fourier series for the first function')
    xlabel('x')
    ylabel('Absolute error')
    legend('N=5','N=10','N=30', 'N=100')
    
end

    