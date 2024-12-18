//Jabra Evolve 30 II

d=56;
h=15;

//Spalt für Stecker links und rechts
s=15;

//Kabeldicke
k=8;

t=3;

$fn=72*2;

cylinder(15, d/2, d/2);

translate([d/2-s/2,-s/2,t])
color("red")
cube([s,s,h]);

color("orange")
cylinder(15, d/2-t, d/2-t);

translate([0,0,t])
color("blue")
cylinder(k, d/2, d/2);