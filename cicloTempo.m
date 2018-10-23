function [ vxNew, vyNew, hNew, Hintegral ] = cicloTempo(deltaT,vx,vy,H,fundo,x,hx,y,hy )

global g

[vxdx,vxdy]=GradientesPeriodico( vx,x,hx,y,hy);

[vydx,vydy]=GradientesPeriodico( vy,x,hx,y,hy);

[Hdx,Hdy]=GradientesNaoPeriodico( H,x,hx,y,hy);

[fundodx, fundody]=GradientesNaoPeriodico(fundo,x,hx,y,hy);

vxNew=vx-deltaT*(vx.*vxdx+g*Hdx);

vyNew=vy-deltaT*(vy.*vydy+g*Hdy);

W=(vx.*Hdx+vy.*Hdy)-(vx.*fundodx+vy.*fundody)+(H-fundo).*(vxdx+vydy);

hNew=H-deltaT*W;

Hintegral=integracao2D( H , x, y);

end