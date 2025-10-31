%Mis hechos

genero([bardock,raditz,goku,'rei cutelo','mr. satan', gohan, goten],[gine,milk,videl,pan]).

%Regla 
masculino(Persona) :-
    genero(Varones, _), member(Persona, Varones).

femenino(Persona) :-
    genero(_, Mujeres), member(Persona, Mujeres).


padre(goku,bardock).
madre(goku,gine).
padre(raditz,bardock).
madre(raditz,gine).

padre(milk,'rei cutelo').
padre(videl,'mr. satan').

padre(gohan,goku).
madre(gohan,milk).
padre(goten,goku).
madre(goten,milk).

padre(pan,gohan).
madre(pan,videl).



%Mis reglas
% 1. padres(Hijo, Padre, Madre)
padres(Hijo, Padre, Madre) :-
    padre(Hijo, Padre),
    madre(Hijo, Madre).

% 2. hijo(Hijo, Padre_o_Madre)
hijo(Hijo, Padre_o_Madre) :-
    (padre(Hijo, Padre_o_Madre); madre(Hijo, Padre_o_Madre)),
    masculino(Hijo).

% 3. hermano(Persona1, Persona2)
hermano(Persona1, Persona2) :-
    (padre(Persona1, Padre); madre(Persona1, Madre)),
    (padre(Persona2, Padre); madre(Persona2, Madre)),
    Persona1 \= Persona2.

% 4. abuelo(Nieto, Abuelo)
abuelo(Nieto, Abuelo) :-
    (padre(Nieto, Progenitor); madre(Nieto, Progenitor)),
    padre(Progenitor, Abuelo),
    masculino(Abuelo).

% 5. abuela(Nieto, Abuela)
abuela(Nieto, Abuela) :-
    (padre(Nieto, Progenitor); madre(Nieto, Progenitor)),
    madre(Progenitor, Abuela),
    femenino(Abuela).

% 6. nieto(Nieto, Abuelo_o_Abuela)
nieto(Nieto, Abuelo_o_Abuela) :-
    abuelo(Nieto, Abuelo_o_Abuela).

nieto(Nieto, Abuelo_o_Abuela) :-
    abuela(Nieto, Abuelo_o_Abuela).