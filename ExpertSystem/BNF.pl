%-------------------------------------GRAMMATICAL RULES

    %   DETERM + LOCATION
    nounPhrase --> determ, place.
    %nounPhrase --> ["En"], Cartago.

    %   VERB + nounPhrase
    verbPhrase --> verb, nounPhrase.
    %verbPhrase --> ["Estoy", "en"], place.

%-------------------------------------GRAMMATICAL RULES

    %   DETERM + LOCATION
    auxNounPhrase --> determ, auxPlace.
    %nounPhrase --> ["En"], Cartago.

    %   VERB + nounPhrase
    auxVerbPhrase --> verb, auxNounPhrase.
    %verbPhrase --> ["Estoy", "en"], auxPlace.
    
 %-------------------------------------SENTENCES

    sentence --> place.
    sentence --> nounPhrase.
    sentence --> verbPhrase.
    sentence --> determ, verbPhrase.
    sentence --> verb, verbPhrase.


%-------------------------------------AUXILIAR SENTENCES
    auxiliarSentence --> auxPlace.
    auxiliarSentence --> auxNounPhrase.
    auxiliarSentence --> auxNounPhrase.
    auxiliarSentence --> determ, auxVerbPhrase.
    auxiliarSentence --> verb, determ, auxVerbPhrase.
    auxiliarSentence --> verb, determ, auxNounPhrase.
    auxiliarSentence --> verb, determ, verb, determ, auxNounPhrase.

%-------------------------------------VERBS

    verb --> ["Estoy"].
    verb --> ["Soy"].
    verb --> ["Voy"].
    verb --> ["Parare"].
    verb --> ["Dirijo"].
    verb --> ["encuentro"].
    verb --> ["Tengo"].
    verb --> ["tengo"].
    verb --> ["pasar"].
    verb --> ["gustaria"].
    verb --> ["ubica"].
    verb --> ["dirijo"].
    verb --> ["esta"].
    verb --> ["Esta"].

%-------------------------------------DETERMINANTS
    determ -->["en"].
    determ -->["En"].
    determ -->["de"].
    determ -->["De"].
    determ -->["a"].
    determ -->["A"].
    determ -->["Se"].
    determ -->["se"].
    determ -->["Al"].
    determ -->["al"].
    determ -->["la"].
    determ -->["para"].
    determ -->["Para"].
    determ -->["que"].
    determ -->["Me"].

%-------------------------------------PLACES

    place --> ["Cartago"].
    place --> ["Corralillo"].
    place --> ["MusgoVerde"].
    place --> ["TresRios"].
    place --> ["SanJose"].
    place --> ["Turrialba"].
    place --> ["Pacayas"].
    place --> ["Paraiso"].
    place --> ["JuanVinas"].
    place --> ["Orosi"].
    place --> ["Cachi"].
    place --> ["Cervantes"].

%-------------------------------------AUXILIAR PLACES
    auxPlace --> ["supermercado"].
    auxPlace --> ["cine"].
    auxPlace --> ["gimnasio"].
    auxPlace --> ["escuela"].
    auxPlace --> ["universidad"].
    auxPlace --> ["cancha"].