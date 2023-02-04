//BoeeblBadschrank
$fn=10;

h1=8;
d1=5.8;

h2=10;
d2=7.6;

cylinder(h=h1, d=d1);
translate([0,0,h1])
cylinder(h=h2, d=d2);
