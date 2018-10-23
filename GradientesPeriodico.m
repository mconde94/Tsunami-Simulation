function [ dx, dy] = GradientesPeriodico( f,x,hx,y,hy)

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

dx(:,4)=(1/(DELTA*hx))*(a1*(f(:,5)-f(:,3))+a2*(f(:,6)-f(:,2))+a3*(f(:,7)+f(:,1))+a4*(f(:,8)+f(:,1)));

dx(:,3)=(1/(DELTA*hx))*(a1*(f(:,4)-f(:,2))+a2*(f(:,5)-f(:,1))+a3*(f(:,6)+f(:,1))+a4*(f(:,7)+f(:,2)));

dx(:,2)=(1/(DELTA*hx))*(a1*(f(:,3)-f(:,1))+a2*(f(:,4)+f(:,1))+a3*(f(:,5)+f(:,2))+a4*(f(:,6)+f(:,3)));

dx(:,1)=(1/(DELTA*hx))*(a1*(f(:,2)+f(:,1))+a2*(f(:,3)+f(:,2))+a3*(f(:,4)+f(:,3))+a4*(f(:,5)+f(:,4)));

dx(:,length(x)-3)=-dx(:,4);

dx(:,length(x)-2)=-dx(:,3);

dx(:,length(x)-1)=-dx(:,2);

dx(:,length(x))=-dx(:,1);

dy(4,:)=(1/(DELTA*hy))*(a1*(f(4,:)-f(2,:))+a2*(f(5,:)-f(1,:))+a3*(f(6,:)+f(1,:))+a4*(f(8,:)+f(1,:)));

dy(3,:)=(1/(DELTA*hy))*(a1*(f(4,:)-f(2,:))+a2*(f(5,:)-f(1,:))+a3*(f(6,:)+f(1,:))+a4*(f(7,:)+f(2,:)));

dy(2,:)=(1/(DELTA*hy))*(a1*(f(3,:)-f(1,:))+a2*(f(4,:)+f(1,:))+a3*(f(5,:)+f(2,:))+a4*(f(6,:)+f(3,:)));

dy(1,:)=(1/(DELTA*hy))*(a1*(f(2,:)+f(1,:))+a2*(f(3,:)+f(2,:))+a3*(f(4,:)+f(3,:))+a4*(f(5,:)+f(4,:)));

dy(length(y)-3,:)=-dy(4,:);

dy(length(y)-2,:)=-dy(3,:);

dy(length(y)-1,:)=-dy(2,:);

dy(length(y),:)=-dy(1,:);

end