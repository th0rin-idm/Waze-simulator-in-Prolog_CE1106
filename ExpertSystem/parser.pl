:-consult('BNF.pl').

%-------------------------------------PARSER

analyzeSentence(Input) :- phrase(sentence, Input).


%-------------------------------------AUXLIAR PARSER

analyzeAuxiliarSentence(Input) :- phrase(auxiliarSentence, Input).