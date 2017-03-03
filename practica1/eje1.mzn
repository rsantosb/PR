
var bool: a;
var bool: b;
var bool: c;
var bool: d;
var bool: e;
var bool: f;
var bool: g;
var bool: h;

constraint  a != b;
constraint  a != d;
constraint  a != e;
constraint  b != c;
constraint  b != f;
constraint  c != d;
constraint  c != g;
constraint  d != h;
constraint  e != f;
constraint  e != h;
constraint  f != g;
constraint  h != g;

solve satisfy;
