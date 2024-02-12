//14//21//3
$fn=72;
h=3;
d1=14;
d2=21;

cylinder(h=h, d1=d2*0.95, d2=d2);
translate([0,0,h])
cylinder(h=h*4, d1=d1, d2=d1*0.95);
