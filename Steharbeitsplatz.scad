//Steharbeitsplatz.scad

include <BOSL2/std.scad>

$fn=90;

d=2.9; //3
tiefe=4;


winkel=75;
r = winkel-90;

module stopfen() {
    cyl(l=tiefe*2, d=d, rounding=0.5); 
}

rotate([90+r,0,0])
stopfen();


//Hoehe Halter
h=51;
//Breite halter
w=9;
//Dicke Halter
t=5;

rotate([r,0,0])
cube([w, t, h]);