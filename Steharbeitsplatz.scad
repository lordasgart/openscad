//Steharbeitsplatz.scad

include <BOSL2/std.scad>

$fn=90;

d=2.8; //3
t=4;

module stopfen() {
    cyl(l=t*2, d=d, rounding=0.5); 
}

stopfen();
