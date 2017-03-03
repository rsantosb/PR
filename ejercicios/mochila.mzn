int: n=3;
set of int: Objects = 1..n;
array[Objects] of int: profit = [29,19,8];
array[Objects] of int: size = [8,5,3];

array[Objects] of var 0..100: saco;
int: size_max = 18;

constraint sum([saco[i]*size[i]|i in Objects])<= size_max;

solve maximize sum([saco[i]*profit[i]|i in Objects]);

output[show(saco)];
