// OpenSCAD Arbeitsleute Küche
// https://openscad.org/cheatsheet/index.html
$fn=36;

abstand=8; //8mm Abstand von Wand
breite=140;
randlr=13;
rando=12;

w1=10;
h1=10;
d1=10;

module Part1() {
    translate([0,0,0]) 
    cube([w1,d1,h1]);
}

Part1();
