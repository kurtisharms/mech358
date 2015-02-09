%Ecem Kahraman, 47962113
%Purpose:  Computing the Fourier series for the second function  
%for x=[-2,2] and plotting the partial sums

clear all

format long 
color=['r','b','m','g']

x=linspace(-2,2,200)

%N values given for finding the first N nonzero terms of this series
N=[5 10 30 100]


for j=1:length(N)
    
    partialsum=0;
    
    %Odd function thus no a_n terms
    for n=1:2:N(j)
        partialsum=partialsum+((4/(pi*n))*sin((n*pi*x)/2));

    end
    
    %a_0=0; thus SN=partial sum found above  
    SN=partialsum;
    
    hold on 
    
    plot(x,SN,color(j),'Linewidth',2)
    title('Plot of the Nth partial sums for the second function')
    xlabel('x')
    ylabel('SN(x)')
    legend('N=5','N=10','N=30', 'N=100')
    
end
