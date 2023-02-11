// OpenSCAD Arbeitsleute Küche
// https://openscad.org/cheatsheet/index.html
$fn=36;

t=3;

abstand=8; //8mm Abstand von Wand
hoehe=161;
breite=140;
dicke=10.5;
randlr=13;
rando=12;
randu=28.5;

//width holder
wh=t+randlr;
//heigt holder
hh = 10;

module Part1() {
    color("brown")
    translate([0,0,0]) 
    cube([breite,dicke,hoehe]);
}

module Part2() {
    color("white")
    translate([randlr,0,randu]) 
    cube([breite-randlr*2,3,hoehe-rando-randu]);
}

difference()
{
    Part1();
    Part2();
}

module Part3()
{
    color("gray")
    translate([-t,-t,0]) 
    cube([wh, t, hh]); //rcube
}

Part3();

module Part4()
{
    color("gray")
    translate([-t,0,0]) 
    cube([t,dicke+abstand,hh]); //rcube
}

Part4();

module Part5() {
    color("gray")
    translate([0,dicke,0]) 
    cube([randlr,abstand,hh]);
}

Part5();

//Hinter dem Abstandhalter für die Schraube
module Part6() {
    color("gray")
    translate([0,dicke+abstand,0]) 
    cube([randlr+t+randlr,t,hh]);
}

Part6();
