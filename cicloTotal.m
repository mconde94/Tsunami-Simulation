function [Hmaximos , Hintegral, T1,T2] = cicloTotal( ax,by,n,tfinal,deltaT )

%construção da grelha
x=linspace(-ax,ax,n);
hx=(ax)/(n-1);
y=linspace(-by,by,n);
hy=(by)/(n-1);
[X,Y] = meshgrid(x,y);

%construção do fundo do mar
fundo=[];
for i=1:length(X);
    for j=1:length(Y);
        fundo(i,j)=b(X(i,j),Y(i,j));
    end
end
figure(01);
g1=surf(X,Y,fundo);
set(g1,'LineStyle','none');
title('Topologia do fundo do mar');
xlabel('x(m)');
ylabel('y(m)');

%condições iniciais
t=0;
vx=zeros(length(x),length(y));
vy=vx;
H=exp((-X.^2-Y.^2));
Hmaximos=[max(H(:))];
Hintegral=[integracao2D( H , x, y)];
figure(02);
g2=surf(X,Y,H);
set(g2,'LineStyle','none');
str = sprintf('Tempo %f (s)',t);
title(str);
zlabel('Altura da onda (m)');
xlabel('x(m)');
ylabel('y(m)');
i=0;
while t<=tfinal
    [ vx, vy, H, Hint ] = cicloTempo(deltaT,vx,vy,H,fundo,x,hx,y,hy );
    Hmaximos=[Hmaximos max(H(:))];
    Hintegral=[Hintegral Hint];
     if rem(i,10)==0
        figure(02);
        g2=surf(X,Y,H);
        set(g2,'LineStyle','none');
        str = sprintf('Tempo %f (s)',t);
        title(str);
        zlabel('Altura da onda (m)');
        xlabel('x(m)');
        ylabel('y(m)');
        pause(deltaT*10);
     end
    if Hmaximos(length(Hmaximos))>1.1;
        break;
    end
    i=i+1;
    t=t+deltaT;
end
T1=linspace(0,t,length(Hmaximos));
T2=linspace(0,t,length(Hintegral));
figure(03);
subplot(2,1,1);
plot(T1,Hmaximos);
title('Altura máxima em função do tempo');
ylabel('H (m)');
xlabel('Tempo (s)');
subplot(2,1,2);
plot(T2,Hintegral);
title('Integral de H(x,y,t) ao longo do tempo')
ylabel('Volume (m³)');
xlabel('Tempo (s)');
end