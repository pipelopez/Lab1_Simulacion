% Esta funcion se encargará de encontrar el conjunto solucion dados los elementos:
% ---> Un conjunto solución, el cual entra como X en los parametros
% ---> Un vector de salidas esperadas o valores reales  de salida, el cual entra como Y
% ---> Y un escalar o tasa de aprendizaje que tambien entra como eta en los parametros
% Una vez termine el proceso se retorna tales pesos o constantes.
function W = regresionMultiple(X,Y,eta)

[N,D]=size(X); % Primero, obtengo las dimensiones del conjunto de entrenamiento
% Donde:::    N = Numero de muestras de entrenamiento
%                   D = Numero de variables o caracteristicas de cada muestra + 1 (El uno de más es por la columna de unos que se le agrega al conjunto X)

W=zeros(D,1); % Luego, creao un vector columna de ceros con los pesos iniciales de las constantes solucion, o mejor dicho, W es el vector solucion inicial

Errores=zeros(200,1); 
% [Opcional] Creo un vector columna de ceros con 100 posiciones que luego comenzare 
% a llenar a medida que vaya calculando los errores de cada ciclo o
% iteracion en el entrenamiento

%Ahora entrenaré el modelo con 100 iteraciones
for iter = 1:200
    %%% Completar el código %%% 
    
    W = W - eta*(1/N)*(((X*W)-Y)'*X)'; % Calculo el nuevo conjunto solucion, lo actualizo y una vez termina el ciclo retorno el conjunto solucion final
    
    %W = W - eta*(1/N)*(((W'*X')'-Y)'*X)';
    % Se invierte el orden de la X y la W pero debe dar los mismo
    
    % [Opcional] Para calcular el error cuadratico medio de este conjunto
    % solucion, lo que hago es simplemente calcular el resultado de la
    % formula:
    %
    %                    1                  N
    % E(W) =   ---------   * Sumatoria {ƒ(xi,w) - Y}^2
    %                   2N               i = 1
    %
    % Y ya con el error, guardar el valor en su respectiva iteracion en el
    % vector de errores.
    temp = (X*W)-Y;
    Errores(iter) = (sum(temp.^2))*(2/N);
    
    %%% Fin de la modificación %%%
end

%[Opcional] Una vez terminan las iteraciones se crea un vector de 100
%posiciones, con los numeros del 1 al 100 y que sera el eje X de la grafica
%de iteraciones vs errores cuadraticos .
numeroIter = linspace(1,200,200);
%[Opcional] Finalmente se grafica
plot(numeroIter,Errores,'b')

end