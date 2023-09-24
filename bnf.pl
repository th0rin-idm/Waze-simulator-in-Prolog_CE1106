%------------------------WELCOME

:- initialization(sayHello).
sayHello :-
 write('Hola usuario, donde se encuentra ubicado actualmente?.'), nl,
 read_string(user_input, "\n", "\r", _, D), 
 write('Vas para '), write(D).

%------------------------BNF
% Grammar BNF in Prolog 
% <origin> ::= "Estoy en " <originPlace> | "Ubicado en" <originPlace> 
% <nombre> ::= "Cartago" | "Tres Rios" | "Taras" | "San Pedro"

% Grammatical rules
origin --> originPlace.
origin --> ["Estoy en "], originPlace.
origin --> ["Ubicado en"], originPlace.

originPlace --> ["Cartago"].
originPlace --> ["Tres Rios"].
originPlace --> ["San Pedro"].
originPlace --> ["Taras"].

%------------------------PARSER

analize_origin(D) :- phrase(origin, D).  

%------------------------SAMPLE
% ?- analize_origin(["Estoy en", "Cartago"]).
% true.
