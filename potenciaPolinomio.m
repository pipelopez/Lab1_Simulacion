% Esta funcion se encarga de adecuar o aumentar las caracteristicas del conjunto de entrenamiento, por lo cual recibe:::
% 1ero) Las muestras en una matriz de N Filas por 2 Columnas
% 2do) Un entero que dice cuantos pares de columnas debe agregar

% Entonces, si el grado es 1 no se cambia la matrix X.

% Si el grado es por ejemplo 2 entonces,
% el  par de columnas que se adjunta es uno aquel 
% donde las muestras se elevan a la dos (^2) pero 
% elemento a elemento.

% Si el grado es 3 entonces,  se agregan dos pares
% de columnas, el primero con cada uno de los elemntos
% elevado al cuadrado y el segundo con sus elementos
% al cubo.

% Y así sucesivamente...

% Una vez termina se retorna la matriz con N filas y 2*grado columnas
function X2 = potenciaPolinomio(X,grado)

X2=X; % En primer lugar se crea una matrix igual a X

if grado~=1 % Luego si el grado es diferente de 2 entonces
    for i=2:grado % Para i que comienza en 2 y aumenta de a 1; mientras sea menor o igual a 2 haga:

        Xe=X.^i; %Xe (Variable temporal) sera igual a las dos columnas (muestras) originales elevadas a la i
        % Recuerde que el punto (.) despues de la X, siginifica que la
        % operacion se hace elemento a elemento
        X2=[X2,Xe]; %Luego, adjunte las nuevas columnas elevedas a la i con las que se llevan acumuladas en X2

    end
end

end