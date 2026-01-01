//-------------------------
//Kuechentuer
//-------------------------

//-------------------------
//Breite Türrahmen
btr=50.4;

//-------------------------
//Tiefe Türrahmen
ttr=13;

//-------------------------
//Tiefe Türangel
tta=19;

//-------------------------
//Höhe Türangel
hta=65;

//-------------------------
//Thickness
t=2.0;

//Breite Blende
bb=t+btr+t;
//Höhe Blende
hb=t+hta+t;
//Tiefe Blende
tb=t+tta+ttr;

cube([bb,tb,hb]);