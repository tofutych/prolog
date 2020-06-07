% В файле дан текст.
% Переставить и вывести в отдельный файл строки заданного текста
% в соответствии с ростом доли согласных в строках. 


% обрабатываем файл, создаем NewPath('new'+path), с помощью tell выбираем вывод, записываем, готово
rewriteFile(Path):- see(Path), readAllLines(List), seen, atom_concat('New', Path, NewPath), tell(NewPath), writeStringsFromList(List), told.

% получаем строки
readAllLines(ResultList):- readln(CurStr), readAllLines(CurStr, [], ResultList).
readAllLines([], []):-!.
readAllLines([], CurList, CurList):- !.
readAllLines(CurStr, CurList, ResultList):- insert(CurList, CurStr, NewList), readln(NewStr), readAllLines(NewStr, NewList, ResultList).


% append(?List1, ?List2, ?List1AndList2)
% List1AndList2 is the concatenation of List1 and List
insert([], NewStr, [NewStr]):- !.
insert([H|T], NewStr, ResultList):- numOfConsInStr(NewStr, N1), numOfConsInStr(H, N2), N1 < N2, append([NewStr], [H], TempList), append(TempList, T, ResultList), !.
insert([H|T], NewStr, ResultList):- insert(T, [H], NewStr, ResultList).
insert([], FirstHalf, NewStr, ResultList):- append(FirstHalf, [NewStr], ResultList), !.
insert([H|T], FirstHalf, NewStr, ResultList):- numOfConsInStr(NewStr, N1), numOfConsInStr(H, N2), N1 < N2, append(FirstHalf, [NewStr], NewFirstHalf), append(NewFirstHalf, [H], TempHead), append(TempHead, T, ResultList), !.
insert([H|T], FirstHalf, NewStr, ResultList):- append(FirstHalf, [H], NewFirstHalf), insert(T, NewFirstHalf, NewStr, ResultList).


% считает согласные в строке
numOfConsInStr(Str, N):- numOfConsInStr(Str, 0, N).
numOfConsInStr([], CurN, CurN):- !.
numOfConsInStr([H|T], CurN, N):- numOfConsInWord(H, N1), NewN is CurN + N1, numOfConsInStr(T, NewN, N).

% считает согласные в слове
% ?- atom_chars(hello, X).
% X = [h, e, l, l, o]
numOfConsInWord(Str, N):- atom_chars(Str, Chars), numOfConsInWord(Chars, 0, N).
numOfConsInWord([], CurN, CurN):- !.
numOfConsInWord([H|T], CurN, N):- consonant(H), NewN is CurN + 1, numOfConsInWord(T, NewN, N), !.
numOfConsInWord([_|T], CurN, N):- numOfConsInWord(T, CurN, N).

% write(+Term)
% Write Term to the current output, using brackets and operators where appropriate.
writeStringsFromList([]):- !.
writeStringsFromList([H|T]):- write_str(H), write('\n'), writeStringsFromList(T).

% put(+Char)
% Write Char to the current output stream. Char is either an integer expression evaluating to a character code or an atom of one character.
write_str([]):-!.
write_str([H|T]):- atom_chars(H, Chars), write_word(Chars), write(' '), write_str(T).

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














