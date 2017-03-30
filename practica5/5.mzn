% Pedro Morell Prats, Javier Martín Villarreal, Rocío Santos Buitrago

int:n; % lado del cuadrado

array [1..n,1..n] of 1..9:h; % hitori
array [1..n,1..n] of var 0..9:t; % sol

% 1
predicate inBounds(array[int,int] of var int:t, var int:i, var int: j) = i in index_set_1of2(t) /\ j in index_set_2of2(t);

% 2
predicate nohayzeroalrededor(array[int,int] of var int:t, var int:i, var int:j) = (not(inBounds(t, i+1, j)) \/ t[i+1, j] != 0) /\ (not(inBounds(t, i-1, j)) \/ t[i-1, j] != 0) /\ (not(inBounds(t, i, j+1)) \/ t[i, j+1] != 0) /\ (not(inBounds(t, i, j-1)) \/ t[i, j-1] != 0);  

%3
predicate haynozeroalrededor(array[int,int] of var int:t,var int:i, var int:j) = (inBounds(t, i+1, j) /\ t[i+1, j] != 0) \/ (inBounds(t, i-1, j) /\ t[i-1, j] != 0) \/ (inBounds(t, i, j+1) /\ t[i, j+1] != 0) \/ (inBounds(t, i, j-1) /\ t[i, j-1] != 0);

%4
predicate copiadeh(array[int,int] of var int:t) = forall(i in index_set_1of2(t), j in index_set_2of2(t))(t[i, j] == 0 \/ t[i, j] == h[i, j]);

%5
predicate cerobien(array[int,int] of var int:t) = forall(i in index_set_1of2(t), j in index_set_2of2(t))(t[i, j] != 0 \/ nohayzeroalrededor(t, i, j));

%6
predicate nocerobien(array[int,int] of var int:t) = forall(i in index_set_1of2(t), j in index_set_2of2(t))(t[i, j] == 0 \/ haynozeroalrededor(t, i, j));

%7
predicate diferenteporfilas(array[int,int] of var int:t) = forall(j in index_set_2of2(t))(forall(k in  index_set_1of2(t), 
                                                                  i in index_set_1of2(t) where k != i)(t[i, j] == 0 \/ t[i,j] != t[k, j]));



%8
predicate diferenteporcolumnas(array[int,int] of var int:t) = forall(i in index_set_1of2(t))(forall(k in  index_set_2of2(t), 
                                                                  j in index_set_2of2(t) where k != j)(t[i, j] == 0 \/ t[i,j] != t[i, k]));

%9
constraint copiadeh(t) /\ cerobien(t) /\ nocerobien(t) /\ diferenteporfilas(t) /\ diferenteporcolumnas(t);

solve satisfy;

%10 output

