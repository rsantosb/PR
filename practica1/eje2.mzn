
include "alldifferent.mzn";

int: nc = 10;

array[1..nc] of var int: a;


constraint alldifferent(a);
constraint a[3] = a[4] - 1 /\ a[3] = a[5] - 2;
constraint a[nc] = 1;
constraint a[6] != nc;
constraint a[7] > a[6] /\ a[7] > a[5] /\ a[7] > a[8];
constraint a[8] != a[9] + 1;

constraint forall(i in 1..nc)(a[i] > 0);
constraint forall(i in 1..nc)(a[i] <= nc);

solve satisfy;


