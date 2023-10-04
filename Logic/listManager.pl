% Predicate to add a given value to each element in the list.
add_value_to_each([], _, []).
add_value_to_each([ELEMENT|REST_ELEMENTS], VALUE, [[ELEMENT, VALUE]|REST_RESULT]) :-
    add_value_to_each(REST_ELEMENTS, VALUE, REST_RESULT).
% Main predicate to add a given value to each element in the list.
add_value_to_elements(SLIST, VALUE, RESULT) :-
    add_value_to_each(SLIST, VALUE, RESULT).
%?- add_value_to_elements([1, 2, 3, 4], 5, Resultado).

% Rule to obtain the last element of the list.
% Input: List, Variable that represent the last item.
% Return: The last element of the input list. 
lastElement([LAST], LAST).
lastElement([_|Tail], LAST) :- lastElement(Tail, LAST).

% Rule to get the first elemento of a list
first_element([FIRST_ELEMENT|_], FIRST_ELEMENT).

% Extract the first element of each sublist
firstExtractor(ELEMLIST, FIRSTELEMENTS) :-
    maplist(first_element, ELEMLIST, FIRSTELEMENTS).
%?- firstExtractor([[TresRios, 8], [MusgoVerde, 10]], PRIMEROS).

% Rule to add an element to the beginning of a list.
add_to_beginning(ELEMENT, LISTORIGINAL, NEWLIST) :-
    NEWLIST = [ELEMENT | LISTORIGINAL].
%?- add_to_beginning(lugar1, [Paris, Osaka, Denver], NuevaLista).

% Rule to add an element to the end of a list.
add_to_end(ELEMENT, [], [ELEMENT]).
add_to_end(ELEMENT, [HEAD|TAIL], [HEAD|NEWLIST]) :-
    add_to_end(ELEMENT, TAIL, NEWLIST).
%?- add_to_end(lugar4, [Paris, Osaka, Denver], NuevaLista).
