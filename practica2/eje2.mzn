
var int: x;

constraint x < 10;
constraint x > 5;
constraint x < 2 * (x - 5);

solve satisfy;
