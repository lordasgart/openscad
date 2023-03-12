    // OpenSCAD: BlendeDilbertHalter.scad
// https://openscad.org/cheatsheet/index.html
$fn=36;


w1=135+0.3*2;
h1=20;
d1=1.67;

module Part1() {
    translate([0,0,0]) 
    cube([w1,d1,h1]);
}

Part1();

/////////////////////////////////////////////////

w2=w1;
h2=1.6;
d2=20;

module Part2() {
    translate([0,0,0]) 
    cube([w2,d2,h2]);
}

Part2();
