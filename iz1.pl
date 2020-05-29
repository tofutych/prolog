% Начинаем с 10, потому что по условию "2, 3, 5 и 7 не считаются усеченными простыми  числами.".
sum(X):- sum(10, 0, X).

% Перебор всей фигни со всей фигней.
sum(1000000,CurrentSum,CurrentSum):-!.
sum(N,CurrentSum,X):-bothRules(N),
                    N1 is N+1,
                    CurrentSum1 is CurrentSum + N,
                    sum(N1,CurrentSum1,X),!.
sum(N,CurrentSum,X):-N1 is N+1, 
                    sum(N1,CurrentSum,X).

% Истинна ли левая и правая простота одновременно.
bothRules(N):-leftPrime(N), rightPrime(N).
% Удяляем крайние цифры и проверяем на простоту. Если вплоть до N < 10 будет простым, то число подходит.
leftPrime(N):- N < 10, prime(N), !.
leftPrime(N):- prime(N), delLeftDig(N, NewN), leftPrime(NewN).

rightPrime(N):- N < 10, prime(N), !.
rightPrime(N):- prime(N), delRightDig(N, NewN), rightPrime(NewN).

% Удаление правых и левых цифр.
delLeftDig(N, Result):- delLeftDig(N, Result, 100000).
delLeftDig(N, Result, Digit):- Remainder is N mod Digit, Remainder \= N, Result is Remainder, !.
delLeftDig(N, Result, Digit):- NextDigit is Digit / 10, delLeftDig(N, Result, NextDigit).

delRightDig(N, Result):- Result is N div 10.


% Проверка на простоту.
prime(X):- prime(X, 2).
prime(0,_):-!,fail.
prime(1,_):-!,fail.
prime(X, N):-N2 is N*N, N2 > X,!.
prime(X, N):-Remainder is X mod N,
            Remainder \= 0,
            N1 is N + 1,
            prime(X, N1).