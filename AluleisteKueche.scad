//Breite
b=15;
//Dicke
d=1.25; //-1.35
//Innen
bi=b-d;
//Schraube oben durchmesser
sod=5;
//Schraube unten durchmesser
sud=2;
//Schraubenkopflänge
skl=d;
//Klickabstand
ka=11;
//Breite-Klickabstand
kb=b-ka;
//thickness
t=d+d+d;

//Front A: volle Hoehe innen, damit auch gut gegen den Boden gedrückt wird
module fronta() {
    translate([0,0,d])
    cube([b,t,bi]);
}

fronta();

module connector()
{
translate([0,0,b])
cube([b,t+t,t+t]);
}

connector();

translate([0,t,bi+t+t])
fronta();

/*
module klick()
{
cube([b,skl,bi-ka]);
}

translate([0,0,d+ka])
klick();

color("green")
translate([0,skl,b])
klick();

color("orange")
translate([0,0,b])
klick();

translate([0,skl,b+kb])
color("gray")
klick();
*/