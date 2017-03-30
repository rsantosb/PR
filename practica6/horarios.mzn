% Rocío Santos Buitrago
% Javier Martín Villarreal
% Pedro Morell Prats


% num asignaturas;  1-> ge , 2->fp, 3->fc, 4-> mdl, 5->mmi
int:n=5;
% num dias con clase
int:dias=5;
% num horas/dia
int:horas=4;

% max. tamaño del bloque
int:maxbloque=2;

% bloques por asignaturas y por bloques, representados como un array unidimensional
array [1..n,1..maxbloque] of 0..horas*dias:bloques = [|0,2 | 2,1 | 2,1 | 4,0 | 4,0 |];

% esto es lo que queremos averiguar: para cada día cuantas horas
% de cada asignatura se imparten?
array [1..dias,1..n] of var 0..maxbloque:horario;

% predicado 1
predicate horasDia(array [1..dias,1..n] of var 0..maxbloque: h) = forall(j in 1..n)(sum (i in 1..dias)(h[i,j]) <= horas);

% predicado 2
predicate nbloques(array [1..dias, 1..n] of var 0..maxbloque: h, var int: a, var 1..maxbloque: bsize, var int: total) = sum (i in 1..dias where h[i, a] = bsize)(1) = total;

% predicado 3
predicate bloquesPorAsignatura(array [1..dias, 1..n] of var 0..maxbloque: h) = forall(j in 1..n)(nbloques(h, j, 1, bloques[j,1]) /\ nbloques(h, j, 2, bloques[j,2]));


constraint horasDia(horario);
%constraint nbloques(horario,4,1,4);
%constraint nbloques(horario,4,2,0)
constraint bloquesPorAsignatura(horario);

solve satisfy;

output ["\n" ++ "Horario: " ++ "\n" ]
++["\nL M X J V\n"]++      
[
if r=1 then "\n" else " " endif ++
show(horario[r,1])
|  r in 1..dias
]
++
[
if r=1 then "\n" else " " endif ++
show(horario[r,2])
| r in 1..dias
]
++
[
if r=1 then "\n" else " " endif ++
show(horario[r,3])
| r in 1..dias
]
++
[
if r=1 then "\n" else " " endif ++
show(horario[r,4])
|  r in 1..dias
]
++
[
if r=1 then "\n" else " " endif ++
show(horario[r,5])
| r in 1..dias
]
++[ "\n"];
