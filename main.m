clc;
clear all;

% defining global variables
global R g

% due to simmetry of the problem you only integrate in one og the quadrants

qdrd=10;
% simulation conditions
R=qdrd;
g=9.80665;
ax=qdrd*1; % size in the x's axis
by=qdrd*1; % size in the y's axis
n=100; % grid intervals
Volumes=[];
Espacamento=[];
disp('5 segundos para a simulação começar');
pause(5);
disp('Vão começar as iterações');
DELTA1=2*ax/(n-1);
DELTA2=2*by/(n-1);
tfinal=10; %total time of integration
deltaT=DELTA1*DELTA2*0.1; %time step
[Hmaximos, Hintegral,T1,T2]=cicloTotal(ax,by,n,tfinal,deltaT);

%observing the graphics
i=1;
Maximos=[];
while T2(i)<=0.4;
    Maximos=[Maximos Hintegral(i)];
    i=i+1;
end
VolumeDeslocado=mean(Maximos)-min(Hintegral);
disp(VolumeDeslocado);
