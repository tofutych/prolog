% Для введенного числа построить список всех его простых делителей,
% причем если введенное число делится на простое число p в степени a,
% то в итоговом списке число p должно повторятся a раз.
% Результирующий список должен быть упорядочен по возрастанию. 

primeDivisors(0, []):-!.
primeDivisors(1, []):-!.
primeDivisors(Num, X):- findDivisors(Num, 2, [], X).


findDivisors(Num, Num, List, ResultList):- prime(Num),
                                           append(List, [Num], ResultList), !.

% Остаток = числу mod divisor  -> если поделили без остатка, то проверяем на простоту!
% Усли проверка прошла, то все ок кидаем в наш список!
findDivisors(Num, Divisor, List, ResultList):- Remainder is Num mod Divisor,
                                               Remainder = 0,
                                               prime(Divisor),
                                               X is Num / Divisor,
                                               append(List, [Divisor], NewList),
                                               findDivisors(X, Divisor, NewList, ResultList), !. % важная строчка 

% Ну тупо перебор
findDivisors(Num, Divisor, List, ResultList):- NextDivisor is Divisor + 1,
                                               findDivisors(Num, NextDivisor, List, ResultList).


% Проверка на простоту.
prime(X):- prime(X, 2).
prime(0,_):-!, fail.
prime(1,_):-!, fail.
prime(X, N):-N2 is N*N, N2 > X, !.
prime(X, N):-Remainder is X mod N,
             Remainder \= 0,
             N1 is N + 1,
             prime(X, N1).


% Result:
% primeDivisors(56, X).
% X = [2, 2, 2, 7].