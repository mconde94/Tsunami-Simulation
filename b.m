function [ out ] = b(x,y )

global R;

chao=0;

r=sqrt(x^2+y^2);

if r<R/3.0;
    
    out=-10.0-chao;
    
elseif r<R;
    
    out=-10 *(cos(3*pi()/4*(r-R/3)/R))^2-chao;
    
else
    
    out=0.0-chao;
    
end