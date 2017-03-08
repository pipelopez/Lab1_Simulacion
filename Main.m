
clc %limpiar
close all %cerrar todo
clear all %limpiar variables

eta=0.1; %%% Taza de aprendizaje
grado=2;     %%% Grado del polinomio

rng('default');
Tipo=input('Ingrese 1 para regresión ó 2 para clasificación: ');

if Tipo==1
    
    %%% Se crean los datos de forma aleatoria %%%
    
    X1=linspace(-20,20,500); %entradas del sistema
    X2=linspace(-50,50,500); %entradas del sistema
    X=[X1',X2']; %genera una matriz de 500*500 con las entradas
    X=zscore(X); %normaliza las entradas, les da igual proporción de afectabilidad del resultado 
    Y=2*X.^3 + 3*X.^2 - 4*X + 6; %genero los datos en y
    Y=min(abs(Y),[],2) + max(abs(Y),[],2).*0.2.*randn(500,1); %distorcionar la función, agregar ruido
    X=[X1',X2']; %trasponer matriz
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%% Se cambia el grado del polinomio %%%
    
    X=potenciaPolinomio(X,grado);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   

    %%% Se hace la partición entre los conjuntos de entrenamiento y prueba.
    %%% Esta partición se hace forma aletoria %%%
    
    rng('default');%me permite particionar siempre igual, muy importante
    ind=randperm(500); %%% Se seleccionan los indices de forma aleatoria,
    %me permite sacar 450 datos aleatoriamente de la matriz.
    
    Xtrain=X(ind(1:450),:);%se sacan los primeros 450 datos de forma aleatoria
    Xtest=X(ind(451:end),:);
    Ytrain=Y(ind(1:450),:);
    Ytest=Y(ind(451:end),:);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Normalización %
    
    [Xtrain,mu,sigma]=zscore(Xtrain);
    Xtest=normalizar(Xtest,mu,sigma);
    
    %%%%%%%%%%%%%%%%%%%%%
    
    %%% Se extienden las matrices %%%
    
    Xtrain=[Xtrain,ones(450,1)]; %se pone el coeficiente independiente a ambos
    Xtest=[Xtest,ones(50,1)];
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%% Se aplica la regresión multiple %%%
    
    W=regresionMultiple(Xtrain,Ytrain,eta); %%% Se obtienen los W coeficientes del polinomio
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%% Se encuentra el error cuadratico medio %%%
    
    Yesti=(W'*Xtest')';
    ECM=(sum((Yesti-Ytest).^2))/length(Ytest);
    
%     Texto=strcat('El Error cuadrático medio en prueba es: ',{' '},num2str(ECM));
    Texto=['El Error cuadrático medio en prueba es: ',num2str(ECM)];
    disp(Texto);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
elseif Tipo==2
    
    %%% Se crean los datos de forma aleatoria %%%
    
    rng('default');%permite particionar nuevamente de la misma forma en cada vez
    
    a=(2*pi).*rand(250,1);%genera muestras aleatorias que formen un círculo 
    r=sqrt(rand(250,1))+1.5;%extiende el radio del círculo
    carac1=(4*r).*cos(a)+0;%ubica las muestras en un lugar del espacio, unos fuera y otros dentro del círculo
    carac2=(3*r).*sin(a)+0;
    X1=[carac1,carac2];%carac1 y 2 representan las coordenadas para una clase X1

    a=(2*pi).*rand(250,1);
    r=sqrt(rand(250,1)) + rand(250,1);
    carac1=(3*r).*cos(a)+0;
    carac2=(2*r).*sin(a)+0;
    X2=[carac1,carac2];

    X=[X1;X2];%uno las clases x1 sobre x2
    Y=[ones(250,1);zeros(250,1)];%etiqueto las muestras con cero o uno para cada clase
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%% Se cambia el grado del polinomio %%%
    
    %X=potenciaPolinomio(X,grado);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    
    %%% Se hace la partición entre los conjuntos de entrenamiento y prueba.
    %%% Esta partición se hace forma aletoria %%%
    
    rng('default');
    ind=randperm(500); %%% Se seleccionan los indices de forma aleatoria
    
    Xtrain=X(ind(1:450),:);
    Xtest=X(ind(451:end),:);
    Ytrain=Y(ind(1:450),:);
    Ytest=Y(ind(451:end),:);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%% Normalización %%%
    
    [Xtrain,mu,sigma]=zscore(Xtrain);
    Xtest=normalizar(Xtest,mu,sigma);
    
%     %%%%%%%%%%%%%%%%%%%%%
%     
%     %%% Se extienden las matrices %%%
%     
%     Xtrain=[Xtrain,ones(450,1)];
%     Xtest=[Xtest,ones(50,1)];
%     
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%     %%% Se aplica la regresión logistica %%%
%     
%     W=regresionLogistica(Xtrain,Ytrain,eta); %%% Se optienen los W coeficientes del polinomio
%     
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     
%     %%% Se encuentra la eficiencia y el error de clasificación %%%
%    
%     Yesti=(W'*Xtest')';
%     Yesti(Yesti>=0)=1;%ubica las muestras en cada clase
%     Yesti(Yesti<0)=0;
%     
%     Eficiencia=(sum(Yesti==Ytest))/length(Ytest);
%     Error=1-Eficiencia;
%     
% %     Texto=strcat('La eficiencia en prueba es: ',{' '},num2str(Eficiencia));
%     Texto=['La eficiencia en prueba es: ',num2str(Eficiencia)];
%     disp(Texto);
% %     Texto=strcat('El error de clasificación en prueba es: ',{' '},num2str(Error));
%     Texto=['El error de clasificación en prueba es: ',num2str(Error)];
%     disp(Texto);
%     
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     
end
