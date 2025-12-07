//Seifenhalter
$fn=36;
//links rechts
lr=15;
//länge
l=50;
//höhe
h=10;
//thickness
t=4;

translate([0,0,h-t])
cube([l, lr, t]);

color("blue")
cube([l, t, h]);