
int: nc = 10;

array[1..nc] of int: a = {1,2,3,4,5,6,7,8,9,0};

array[1..nc] of var int: b;

constraint forall(i in 1..nc)(exists(j in 1..nc)(a[i]==b[j]));


solve satisfy;