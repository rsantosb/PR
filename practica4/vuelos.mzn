%Rocío María Santos Buitrago
%Javier Martín Villarreal
%Pedro Morell Prats


int: n;
int: ini;
int: fin;
int: max;

array [1..n,1..n] of int: t;

array[1..n] of var 1..n: recorrido;
var 1..n: posfin;

%var int: coste;
var int: escalas;
%constraint coste= sum(i in 1..posfin) (t[recorrido[i], recorrido[i+1]]);
constraint escalas=posfin;

constraint recorrido[1] = ini /\ recorrido[posfin]=fin;

constraint forall(i in 1..n-1) (t[recorrido[i],recorrido[i+1]] != -1);

%solve satisfy;
%solve minimize coste;
solve minimize escalas;


