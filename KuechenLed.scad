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

module Lampe()
{
    difference()
    {
        Part1();
        Part2();
    }
}

//Lampe();

module Part3()
{
    color("gray")
    translate([-t,-t,0]) 
    cube([wh, t, hh]); //rcube
}

module Part4()
{
    color("gray")
    translate([-t,0,0]) 
    cube([t,dicke+abstand,hh]); //rcube
}

module Part5() {
    color("gray")
    translate([0,dicke,0]) 
    cube([randlr,abstand,hh]);
}

//Hinter dem Abstandhalter für die Schraube
module Part6() {
    color("gray")
    translate([-t,dicke+abstand,0]) 
    cube([randlr+t+randlr,t,hh]);
}

module Part7() {    
    translate([randlr+randlr-t-t,dicke+abstand+t,hh/2]) 
    rotate([90,0,0])
    color("blue")
    cylinder(h=t, d2=3.5, d1=0.5);
}

module holder()
{
    Part3();
    Part4();
    Part5();
    Part6();
}

difference()
{
    holder();
    Part7();
}
