% Есть четыре боксера: Томас Герберт, Герберт Френсис, Френсис Джеймс и Джеймс Томас. 
% Герберт намного сильнее Томаса. 
% Френсис сильнее и Томаса и Герберта. 
% Герберт слабее Джеймса, но сильнее Френсиса. 
% В каком порядке нужно расположить боксеров от слабейшего к сильнейшему? 


% поочередное логически собираем боксериков в общий список
list_of_boxers(List):- insert([], herbert, List1),
                       insert(List1, tomas, List2),
                       insert(List2, fransis, List3), 
                       insert(List3, james, List).


% поместили herbert в List1
insert([], Boxer, [Boxer]):- !.

% Если боксер-голова сильнее того, с кем сравниваем, то
% соединяем голову с тем, с кем сравниваем, а потом их объдинение соединяем в ResultList
% например, после нашего первого insert(строка 9), List1 = [herbert]
%         а после нашего второго insert(строка 10) List2 = [tomas, herbert]
insert([H|T], Boxer, ResultList):- strongerThan(H, Boxer), 
                                   append([Boxer], [H], TempList), 
                                   append(TempList, T, ResultList), 
                                   !.

% Но если условие в 22 строке не выполнилось, то мы попадаем сюда!
insert([H|T], Boxer, ResultList):- insert(T, [H], Boxer, ResultList).

insert([], FirstHalf, Boxer, ResultList):- append(FirstHalf, [Boxer], ResultList), 
                                           !.

% сравниваем голову с сравниваемым боксериком и если голова сильнее, то
% соединяем нашу голову из строки 28 с сравниваемым боксериком в NewFirstHalf
% затем NewFirstHalf + текущая голова в TempHead
% и затем TempHead + T = ResultList
% например, тут уже будет соединение [tomas] + [fransis]
%                         [tomas, fransis] + [herbert]
%                         [tomas, fransis, herbert] + [] = [tomas, fransis, herbert]
insert([H|T], FirstHalf, Boxer, ResultList):- strongerThan(H, Boxer), 
                                              append(FirstHalf, [Boxer], NewFirstHalf), 
                                              append(NewFirstHalf, [H], TempHead), 
                                              append(TempHead, T, ResultList), 
                                              !.

% Но если в 40 строке не выполнилось условие, то попадаем сюда(как наш james)
% соединяем нашу голову(tomas) из 28 строки с текущей головой(fransis) в NewFirstHalf
% и вызываем insert, которйы опять перенесет нас к 40 строке, но затем опять сюда, 
% после чего наше тело останется пустым и мы прыгнем на 30 строку!
insert([H|T], FirstHalf, Boxer, ResultList):- append(FirstHalf, [H], NewFirstHalf), 
                                              insert(T, NewFirstHalf, Boxer, ResultList).


% условие задачи
strongerThan(herbert, tomas).
strongerThan(fransis, tomas).
strongerThan(fransis, herbert).
strongerThan(james, herbert).
strongerThan(herbert, fransis).