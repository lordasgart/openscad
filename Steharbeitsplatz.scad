//Steharbeitsplatz.scad

include <BOSL2/std.scad>

$fn=90;

d=2.75; //3
t=6.5;

module stopfen() {
    cyl(l=t*2, d=d, rounding=0.5); 
}

stopfen();
