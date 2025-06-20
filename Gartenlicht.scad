//Gartenlicht
include <BOSL2/std.scad>
$fn=180;
aussen=75;
innen=71; //72
hoehe=142;

oben=68;
unten=61;
laenge_zylinder=25;
laenge_kerze=140;

mt=(aussen-innen)/2;

t=5;

module Metal() {
    difference() {
        cube([aussen, aussen, hoehe]);
    }
}

module Metal_hohl() {
    difference() {
        cube([aussen, aussen, hoehe]);
    translate([mt,mt,0])
    cube([innen, innen, hoehe]);
    }
}

//Metal();

module Kerze() {
    translate([(aussen)/2,(aussen)/2,hoehe])
    cylinder(h=laenge_kerze-laenge_zylinder, d=oben);
    
    color("green")
    translate([(aussen)/2,(aussen)/2,hoehe-laenge_zylinder])
    cylinder(h=laenge_zylinder, d2=oben, d1=unten);
}

//Kerze();

module deckel() {        
    translate([aussen/2,aussen/2,hoehe-laenge_zylinder/2])
    cuboid([aussen, aussen, laenge_zylinder+t*2], rounding=2);
}

module deckelc() {        
    translate([0,0,hoehe-laenge_zylinder-t])
    cube([aussen, aussen, laenge_zylinder+t*2]);
}

module a() {
difference() {
    deckel();
    Kerze();
    Metal();
}
    
difference() {
    deckel();
    Kerze();
}
}

s=1;
scale([s,s,s])
{
difference() {
a();Metal_hohl(); }
    }