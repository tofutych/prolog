% В файле дан текст.
% Переставить и вывести в отдельный файл строки заданного текста
% в соответствии с ростом доли согласных в строках. 



% обрабатываем файл, создаем NewPath('Result'+path), с помощью tell выбираем вывод, записываем, готово.
rewriteFile(Path):- see(Path), readAllLines(List), seen, atom_concat('Result', Path, NewPath), tell(NewPath), writeStringsFromList(List), told.


% рекурсивено получаем строки. читаем одну , записываем и по кругу
readAllLines(ResultList):- readln(CurStr), 
                           readAllLines(CurStr, [], ResultList).

readAllLines([], []):-!.

readAllLines([], CurList, CurList):- !.

readAllLines(CurStr, CurList, ResultList):- insert(CurList, CurStr, NewList), 
                                            readln(NewStr), 
                                            readAllLines(NewStr, NewList, ResultList).


% append(?List1, ?List2, ?List1AndList2)
% List1AndList2 is the concatenation of List1 and List
insert([], NewStr, [NewStr]):- !.

% сравниваем колво гласных в новой строке и голове
% если так то склеиваем проверяемую строку и бошку в TempList
% и потом склеиваем templist и t в resultlist
insert([H|T], NewStr, ResultList):- numOfConsInStr(NewStr, N1), 
                                    numOfConsInStr(H, N2),
                                    N1 < N2, 
                                    append([NewStr], [H], TempList), 
                                    append(TempList, T, ResultList), 
                                    !.

% но если сравнение не прошло, то начинаются эти прикролы
insert([H|T], NewStr, ResultList):- insert(T, [H], NewStr, ResultList).

% Так как FirstHalf впервые у нас это просто голова, то для удобства буду называть это "бошкой"
% если тело пусто, то просто соединяем "бошку" и новую строку в ResultList
insert([], FirstHalf, NewStr, ResultList):- append(FirstHalf, [NewStr], ResultList), 
                                            !.

% если было тело, то грубо говоря делаем то же самое, что и при insert в 31 строке
insert([H|T], FirstHalf, NewStr, ResultList):- numOfConsInStr(NewStr, N1), 
                                               numOfConsInStr(H, N2), 
                                               N1 < N2, 
                                               append(FirstHalf, [NewStr], NewFirstHalf), 
                                               append(NewFirstHalf, [H], TempHead), 
                                               append(TempHead, T, ResultList), 
                                               !.

% но если и выше проверка не прошла, то переходим сюда и склеиваем "бошку" с телом, а потом опять insert
insert([H|T], FirstHalf, NewStr, ResultList):- append(FirstHalf, [H], NewFirstHalf), 
                                               insert(T, NewFirstHalf, NewStr, ResultList).



% рекурсивно считает согласные в строке. опустошим список - закончим!
numOfConsInStr(Str, N):- numOfConsInStr(Str, 0, N).

numOfConsInStr([], CurN, CurN):- !.

numOfConsInStr([H|T], CurN, N):- numOfConsInWord(H, N1),
                                 NewN is CurN + N1, 
                                 numOfConsInStr(T, NewN, N).


% ?- atom_chars(hello, X).
% X = [h, e, l, l, o]
% считаем согласные в слове. бьем слово на список из его букв. потом обрабатываем список,
% проверяя каждую букву гласная ли она. ну и если гласная, то, соответственно, увеличиваем счетчик!
numOfConsInWord(Str, N):- atom_chars(Str, Chars), 
                          numOfConsInWord(Chars, 0, N).

numOfConsInWord([], CurN, CurN):- !.

numOfConsInWord([H|T], CurN, N):- consonant(H),
                                  NewN is CurN + 1,
                                  numOfConsInWord(T, NewN, N), 
                                  !.

numOfConsInWord([_|T], CurN, N):- numOfConsInWord(T, CurN, N).


% write(+Term)
% Write Term to the current output!
% выводим строки из из списка и записываем по словам!
writeStringsFromList([]):- !.
writeStringsFromList([H|T]):- write_str(H), write('\n'), writeStringsFromList(T).


% put(+Char)
% Write Char to the current output stream. Char is either an integer expression evaluating to a character code or an atom of one character.
write_str([]):-!.
write_str([H|T]):- atom_chars(H, Chars), write_word(Chars), write(' '), write_str(T).


% put(+Char).
% Write Char to the current output stream.
% рекурсивно записываем слова в текущий выходной поток!
write_word([]):- !.
write_word([H|T]):- put(H), write_word(T).


consonant('B').
consonant('C').
consonant('D').
consonant('F').
consonant('G').
consonant('H').
consonant('J'). 
consonant('K').
consonant('L').
consonant('M').
consonant('N').
consonant('P').
consonant('Q').
consonant('R').
consonant('S').
consonant('T').
consonant('V'). 
consonant('W').
consonant('X').
consonant('Z').

consonant(b). 
consonant(c).
consonant(d).
consonant(f).
consonant(g).
consonant(h).
consonant(j).
consonant(k).
consonant(l).
consonant(m).
consonant(n).
consonant(p). 
consonant(q).
consonant(r).
consonant(s).
consonant(t).
consonant(u). 
consonant(v).
consonant(w).
consonant(x).
consonant(z).














