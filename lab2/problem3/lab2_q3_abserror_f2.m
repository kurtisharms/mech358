%Ecem Kahraman, 47962113
%Purpose: Computing and plotting the error in Fourier series for the 
%second function

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
        partialsum=partialsum+((4/(pi*n)).*sin((n*pi*x)/2));

    end
    
    %a_0=0; thus SN=partial sum found above  
    SN=partialsum;
    
    %defining the actual function F2
    F2=zeros(1,length(x));
    for k=1:length(x)
        if x(k)>0;
            F2(k)=1;
        else 
            F2(k)=-1;
        end
    end
    
    abserr=abs(SN-F2);
    
    hold on
    
    plot(x,abserr,color(j),'Linewidth',2)
    title('Absolute error in Nth partial sum of Fourier series for the second function')
    xlabel('x')
    ylabel('Absolute error')
    legend('N=5','N=10','N=30', 'N=100')
    
end
    
    
            
            
    