% собираем боксериков в общий List
list_of_boxers(List):- insert([], herbert, List1), insert(List1, tomas, List2),
    insert(List2, fransis, List3), insert(List3, james, List).


insert([], Boxer, [Boxer]):- !.
insert([H|T], Boxer, ResultList):- strongerThan(H, Boxer), append([Boxer], [H], TempList), append(TempList, T, ResultList), !.
insert([H|T], Boxer, ResultList):- insert(T, [H], Boxer, ResultList).
insert([], FirstHalf, Boxer, ResultList):- append(FirstHalf, [Boxer], ResultList), !.
insert([H|T], FirstHalf, Boxer, ResultList):- strongerThan(H, Boxer), append(FirstHalf, [Boxer], NewFirstHalf), append(NewFirstHalf, [H], TempHead), append(TempHead, T, ResultList), !.
insert([H|T], FirstHalf, Boxer, ResultList):- append(FirstHalf, [H], NewFirstHalf), insert(T, NewFirstHalf, Boxer, ResultList).

strongerThan(herbert, tomas).
strongerThan(fransis, tomas).
strongerThan(fransis, herbert).
strongerThan(james, herbert).
strongerThan(herbert, fransis).
