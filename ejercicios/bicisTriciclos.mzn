
int: horas = 40;
var  0..6000: B; %cantidad de bicis
var 0..4000: T; %cantidad de triciclos en la semana
var int: gano;

constraint 140*B + 200*T <= (200*140)*40;

constraint gano = 25*B + 30*T;

solve maximize gano;