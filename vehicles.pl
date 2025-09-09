% ========================================
%  Catálogo de Vehículos
% ========================================
% Cada vehículo se representa con el predicado:
% vehicle(Marca, Referencia, Tipo, Precio, Año).
%
% Tipos válidos: suv, sedan, pickup, sport
% ========================================

vehicle(toyota,    rav4,      suv,    28000, 2022).
vehicle(toyota,    corolla,   sedan,  22000, 2023).
vehicle(toyota,    hilux,     pickup, 35000, 2021).

vehicle(ford,      mustang,   sport,  45000, 2023).
vehicle(ford,      explorer,  suv,    38000, 2022).
vehicle(ford,      fiesta,    sedan,  18000, 2020).

vehicle(bmw,       x5,        suv,    60000, 2021).
vehicle(bmw,       serie3,    sedan,  42000, 2022).
vehicle(bmw,       m4,        sport,  70000, 2023).

vehicle(chevrolet, camaro,    sport,  55000, 2021).
vehicle(chevrolet, tracker,   suv,    23000, 2022).
vehicle(chevrolet, onix,      sedan,  17000, 2023).



% ========================================
%  Parte 2: Consultas y filtros
% ========================================

% meet_budget(+Referencia, +PresupuestoMax).
% Verifica si un vehículo está dentro del presupuesto.
meet_budget(Reference, BudgetMax) :-
    vehicle(_, Reference, _, Price, _),
    Price =< BudgetMax.

% vehicles_by_brand(+Marca, -Lista).
% Devuelve todas las referencias de una marca específica.
vehicles_by_brand(Brand, List) :-
    findall(Ref, vehicle(Brand, Ref, _, _, _), List).



% ========================================
% Parte 3: Reportes
% ========================================

% generate_report(+Marca, +Tipo, +Presupuesto, -Resultado).
% Genera un reporte de vehículos que cumplen con:
%   - Una marca específica
%   - Un tipo de vehículo
%   - Un presupuesto máximo
%
% El resultado incluye:
%   - Lista de vehículos encontrados (Referencia, Precio, Año)
%   - Valor total de la selección
% Si el inventario supera $1,000,000 se muestra advertencia.
generate_report(Brand, Type, Budget, Result) :-
    findall((Ref, Price, Year),
        (vehicle(Brand, Ref, Type, Price, Year), Price =< Budget),
        Vehicles),
    sum_prices(Vehicles, 0, Total),
    (   Total =< 1000000
    ->  Result = (Vehicles, Total)
    ;   Result = ('⚠️ Excede el límite de inventario', Total)
    ).

% sum_prices(+ListaVehículos, +Acumulador, -Total).
% Calcula el valor total de una lista de vehículos.
sum_prices([], Acc, Acc).
sum_prices([(_, Price, _)|T], Acc, Total) :-
    Acc1 is Acc + Price,
    sum_prices(T, Acc1, Total).



% ========================================
%  Parte 4: Casos de prueba
% ========================================

% Caso 1:
% Listar todas las SUV Toyota con precio menor a $30,000.
test_case1(Result) :-
    findall(Ref,
            (vehicle(toyota, Ref, suv, Price, _), Price < 30000),
            Result).

% Caso 2:
% Mostrar vehículos Ford agrupados por tipo y año (usando bagof/3).
test_case2(Result) :-
    bagof((Type, Year, Ref),
          vehicle(ford, Ref, Type, _, Year),
          Result).

% Caso 3:
% Calcular el valor total de los sedanes sin superar $500,000.
test_case3(Result) :-
    findall((Ref, Price),
            (vehicle(_, Ref, sedan, Price, _), Price =< 500000),
            Vehicles),
    sum_prices(Vehicles, 0, Total),
    (   Total =< 500000
    ->  Result = (Vehicles, Total)
    ;   Result = ('⚠️ Excede límite de presupuesto', Total)
    ).