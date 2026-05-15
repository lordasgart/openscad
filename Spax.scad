
include <BOSL2/std.scad>
include <BOSL2/screws.scad>

/*screw(
    spec="M3", 
    l=15, 
    head="flat", 
    headsize=6, 
    drive="pz2", 
    pitch=1.5, 
    pointed=true
);*/

$fn=36;

screw(
    spec="M3", 
    l=15, 
    head="flat"
);