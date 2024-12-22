a=400;
b=3.5;
c=9.5;
d=70;
sk=5;

$fn=90;

difference() {
cube([b*3, b*3, d]);

translate([0,b,d-c*2])
cube([a, b, c]);

translate([0,b,d-c*5])
cube([a, b, c]);
}

difference() {
translate([0,-b*3,0])
cube([b*3,b*9,b]);

translate([b*3/2,-b*3/2,0])
color("red")
cylinder(h=b, d1=2, d2=sk);

translate([b*3/2,b*3*1.5,0])
color("red")
cylinder(h=b, d1=2, d2=sk);
}