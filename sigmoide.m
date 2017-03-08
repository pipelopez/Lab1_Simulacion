function x2 = sigmoide(x) % La funcion sigmoide recibira como parametro una MATRIZ x y devolvera una MATRIZ g de las mismas dimensiones 
    
    x2 = 1./(1 + exp(-x)); % Entonces g es igual a la funcion sigmoidal aplicada a cada uno de los elementos de la matriz x
    
    % ====== NOTA ======
    % El punto (.) que va despues del 1 es importante porque 
    % realiza esta operacion de elemento a elemento, osea,
    % aplica la funcion::
    %
    %                 1
    % g = -----------------   ; (Siendo x un escalar)
    %         1 + exp(-x)
    %
    % a todos los elementos de la matriz x de manera individual
    %
    % Sin dicho punto se presentaria un error porque la funcion
    % sigmoidal no trabaja en si con matrices.
    % ==================
end