:-consult('Logic/dijkstra2.pl').
:-consult('Logic/splitter.pl').
:-consult('ExpertSystem/parser.pl').
:-consult('Logic/listManager.pl').
:-consult('Logic/quicksort.pl').

%-------------------------------------WELCOME
heywazelog :-
    nl, write('Hola usuario, bienvenido.'), 
    nl, write("NOTA: Recuerde usar MAYUSCULAS donde es debido y evitar tanto tildes como puntos finales."), 
    nl, getOrigin.
 
%-------------------------------------WAZELOG EXPERT SYSTEM
getOrigin:-
    nl,write('Donde se encuentra ubicado actualmente?.'), nl,
    read_string(user_input, "\n",  "\r", _, START),
    split_string(START, ' ', SUBLIST_START), 
    lastElement(SUBLIST_START, LASTITEM_START), 
    (analyzeSentence(SUBLIST_START) -> getDestination(LASTITEM_START) ; originError).
    
getDestination(START):-
    %write(START),nl,
    nl,write('Favor ingresa tu destino.'), nl,
    read_string(user_input, "\n", "\r", _, END),
    split_string(END, ' ', SUBLIST_END), 
    lastElement(SUBLIST_END, LASTITEM_END), 
    %write(LASTITEM_END),nl,
    (analyzeSentence(SUBLIST_END) -> addIntermediate(START,[],LASTITEM_END) ; destinyError).


addIntermediate(START,INTERMEDIATE_LIST,END):-
    %write(END),nl,
    nl,write('Okay. Ingresa un punto intermedio o escribe "ya" para terminar.'), nl,
    read_string(user_input, "\n", "\r", _, INTERMEDIATE),
    split_string(INTERMEDIATE, ' ', SUBLIST_INTER), 
        (INTERMEDIATE = "ya" -> answer(START,INTERMEDIATE_LIST,END)
        ; 
            (analyzeSentence(SUBLIST_INTER) -> 
                lastElement(SUBLIST_INTER, LASTITEM), 
                %write(LASTITEM),write('m'),nl,
                route(START,LASTITEM,TIME,RUTE),
                %write(START),write('m'),write(LASTITEM),write('m'), %todo bien
                %write(TIME),nl,
                %write(RUTE),nl,
                add_value_to_elements([LASTITEM], TIME, ITEMNUM),
                %write([LASTITEM]),write('m'),write(TIME),write('m'),write(ITEMNUM),write('m'),nl,
                append(INTERMEDIATE_LIST, ITEMNUM, NEW_INTERMEDIATE_LIST), 
                write(NEW_INTERMEDIATE_LIST),
                addIntermediate(START,NEW_INTERMEDIATE_LIST,END))
            ; 
            (analyzeAuxiliarSentence(SUBLIST_INTER) -> interDirectioner(START,INTERMEDIATE_LIST,END))   
                %aqui llamamos a los predicados correspondientes que preguntan cual y donde
                
            ; %si no se cumple, llama error
            intermediateError(INTERMEDIATE_LIST)).

interDirectioner(START,INTERMEDIATE_LIST,END) :-
    nl,write("Cual?"), nl,
    read_string(user_input, "\n", "\r", _, SITUATION), 
    nl, write("Indicame donde queda "),
    write(SITUATION), 
    write("?"), nl,
    read_string(user_input, "\n", "\r", _, SITUATION_INTERMEDIATE),
    split_string(SITUATION_INTERMEDIATE, ' ', SUBLIST_SITUATION), 

    (analyzeSentence(SUBLIST_SITUATION) -> 
        lastElement(SUBLIST_SITUATION, LASTITEM), 

        route(START,LASTITEM,TIME,RUTE),
        %write(START),write('m'),write(LASTITEM),write('m'), %todo bien
        add_value_to_elements([LASTITEM], TIME, ITEMNUM),
        %write(ITEMNUM),write('m'),nl,

        append(INTERMEDIATE_LIST, ITEMNUM, NEW_INTERMEDIATE_LIST),

        addIntermediate(START,NEW_INTERMEDIATE_LIST, END)
    ;
    intermediateError(START,NEW_INTERMEDIATE_LIST, END)).
    
answer(START,INTERMEDIATE_LIST,END) :-
    quicksort(INTERMEDIATE_LIST, SORTEDLIST),
    firstExtractor(SORTEDLIST,FINALINTER_LIST),

    add_to_beginning(START, FINALINTER_LIST, START_INTER),
    add_to_end(END, START_INTER, START_INTER_END),

    calculate_total_duration_and_route(START_INTER_END, TDURATION, TROUTE),
    add_to_beginning(START, TROUTE, FINAL_ROUTE),

    nl,write('Tu ruta a seguir es la siguiente:'), nl,
    nl,write(FINAL_ROUTE),nl,
    %write(INTERMEDIATE_LIST),write(SORTEDLIST),
    nl,write('Con un tiempo estimado de: '),nl,nl, 
    write(TDURATION),
    write(" minutos en horario normal."),nl,
    multiply_by_2(TDURATION,TDURATION_DAM),
    write(TDURATION_DAM),
    write(" minutos en hora pico."),nl,


    (endConversation(START,SORTEDLIST,END)).
    
endConversation(START,SORTEDLIST,END):-
    nl,write('Deseas terminar la conversacion? (si/no)'), nl, 
    read_string(user_input, "\n", "\r", _, TERMINATE),
    nl,(TERMINATE = "si" -> write('Gracias por usar el programa. Conversacion terminada.'), nl, nl ; addIntermediate(START,SORTEDLIST,END)). 

%-------------------------------------ERROR MANAGER
originError:-
    nl, write("El origen ingresado no se encuentra en mi base de datos o no comprendo tu entrada, favor ingresa una distinta."),nl,
    getOrigin.

destinyError:-
    nl, write("El destino ingresado no se encuentra en mi base de datos o no comprendo tu entrada, favor ingresa una distinta."),nl,
    getDestination.

intermediateError(START,INTERMEDIATE_LIST,END):-
    nl, write("El destino ingresado no se encuentra en mi base de datos o no comprendo tu entrada, favor ingresa una distinta."),nl, 
    addIntermediate(START,INTERMEDIATE_LIST,END).
    



