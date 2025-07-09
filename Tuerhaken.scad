//Tiefe Würfel 1
x=26;
//Breite Haken
y=10;
//Höhe Würfel 1
z=13;

//Dicke Türrahmen
a=16;

//Thickness
t=8;

//Länge Haken
l=x-t;
//Tiefe Haken
th=t*2.5;
//Höhe Haken vorne
hh=t*3;

module wuerfel1()
{
    cube([x,y,z]);
}

module oben()
{
    color("green")
    translate([-a,0,z])
    cube([x+a,y,t]);
}

module hinten()
{
    color("blue")
    translate([-a-t,0,-(hh-z-t)])
    cube([t,y,hh]);
}

module vorne()
{
    color("orange")
    translate([x,0,-l])
    cube([t,y,z+t+l]);
}

module unten()
{
    color("yellow")
    translate([x,0,-l-t])
    cube([th,y,t]);
}

module hakenvorne()
{
    color("purple")
    translate([x+th,0,-l-t])
    cube([t,y,hh]);
}

wuerfel1();
oben();
hinten();
vorne();
unten();
hakenvorne();
