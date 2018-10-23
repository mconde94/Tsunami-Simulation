function [ dx, dy ] = GradientesNaoPeriodico(  f,x,hx,y,hy)
lim=5;

dx=zeros(length(x),length(y));

dy=zeros(length(x),length(y));

DELTA=840;

a1=672;

a2=-168;

a3=32;

a4=-3;

for i=lim:length(x)-lim
    
    for j=1:length(y)
        
        dx(i,j)=(1/(DELTA*hx))*(a1*(f(i+1,j)-f(i-1,j))+a2*(f(i+2,j)-f(i-2,j))+a3*(f(i+3,j)-f(i-3,j))+a4*(f(i+4,j)-f(i-4,j)));
        
    end
    
end

for i=1:length(x)
    
    for j=lim:length(y)-lim
        
        dy(i,j)=(1/(DELTA*hy))*(a1*(f(i,j+1)-f(i,j-1))+a2*(f(i,j+2)-f(i,j-2))+a3*(f(i,j+3)-f(i,j-3))+a4*(f(i,j+4)-f(i,j-4)));
        
    end
    
end

for i=1:4
    
    dx(:,i)=dx(:,5);
    
    dx(:,length(x)+1-i)=dx(:,length(x)-4);
    
    dy(i,:)=dy(5,:);
    
    dy(length(y)+1-i,:)=dy(length(y)-4,:);
    
end

end

