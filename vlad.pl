sum(List, X):- sum(List, 0, X).  % получаем на ввод список из чисел и Х - результат их суммирования, который вычислим!(пример использования предиката на строке 6)
                                 % В качестве стартовой суммы передаем 0                                                                                          tofut was here

sum([], New_cur_sum, New_cur_sum):- !.  % когда опустошим список, то нашим Х станет сумма, которую мы нашли(New_cur_sum)
sum([H|T], Cur_sum, X):- New_cur_sum is Cur_sum + H,  % Тут производятся рекурсивные вычиления: В New_cur_sum помещаем результат сложения текущей суммы и нашей головы
                         sum(T, New_cur_sum, X).
% ?- sum([1, 2, 3, 4, 5], X).
% X = 15.



mul(List, X):- mul(List, 1, X).  % получаем на ввод список из чисел и Х - результат их умножения, который вычислим!(пример использования предиката на строке 19)
                                 % В качестве стартового результата перемножения передаем 1, потому что                                                         tofut was here
                                 % если мы передадим 0, то на выходе и получим 0.

mul([], New_cur_mul, New_cur_mul):- !.  % когда опустошим список, то нашим Х станет перемножение, которое мы нашли(New_cur_mul)
mul([H|T], Cur_mul, X):- New_cur_mul is Cur_mul * H,  % Тут производятся рекурсивные вычиления: В New_cur_mul помещаем результат умножения текущего перемножения и нашей головы
                         mul(T, New_cur_mul, X).
% mul([1, 2, 3, 4, 5], X). 
% X = 120.