//7.1 tiefe
//86 hoehe
//40 breite

//14,5 tiefe
//42 breite
//100,25 hoehe

f=1.08; //we scale with f here already and not on the printer to keep the suggested line widths ;)

d=7.1*f;
b=42*f;
h=100.25*f;

t=1.7; //4 lines
th=t; //0.3+0.2*7

cube([b,d,th]);
