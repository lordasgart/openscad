// OpenSCAD 
// https://openscad.org/cheatsheet/index.html
// https://openscad.cloud/openscad/
// https://autodrop.cloud/
$fn=36;

w1=10;
h1=10;
d1=10;

module Part1() {
    translate([0,0,0]) 
    cube([w1,d1,h1]);
}

Part1();
