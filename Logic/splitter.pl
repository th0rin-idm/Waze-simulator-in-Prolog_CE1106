% Load the required library
:- use_module(library(strings)).

% Define a string
stringSample("Hola mundo de Gumball").

% Split the string using a splitter
split_string(CHAIN, SPLITTER, SUBSTRING_LIST) :-
    split_string(CHAIN, SPLITTER, "", SUBSTRINGS), % Obtén las subcadenas sin comillas

    % Envuelve cada subcadena en comillas y agrégala a la nueva lista
    maplist(wrap_in_quotes, SUBSTRINGS, SUBSTRING_LIST).

% Predicado auxiliar para envolver una subcadena en comillas
wrap_in_quotes(SUBSTRING, SUBSTRING_MARK) :-
    string_concat('', SUBSTRING, TEMP), % Agrega comillas al principio
    string_concat(TEMP, '', SUBSTRING_MARK). % Agrega comillas al final

ejemploSepararCadenas :-
    split_string("Actualmente estoy ubicado en Puntarenas", " ", SUBSTRINGS),
    write(SUBSTRINGS).
%:- ejemploSepararCadenas.

% Predicate to multiply the value of a variable by 2.
multiply_by_2(X, Result) :-
    Result is X * 2.


