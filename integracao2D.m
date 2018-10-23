function [ integral ] = integracao2D( funcao , X, Y)

integral=trapz(Y,trapz(X,funcao,1));

end