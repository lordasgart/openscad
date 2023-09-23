$fn=36;

t=1.2;
//Länge die wir brauchen
w=30;
//Tiefe in die Platte (ohne Zusatz)
d=8;
//Hoehe der Platte (ohne Zusatz)
h=3;

//cube([w, d+t, h+t+t]);

include <roundedcorners.scad>;

module corner()
{

translate([0,d+t,0])
rotate_extrude(angle=90)
//rotate([0,270,0])
projection()
rotate([0,90,90])
color("Green")
roundedcube([w, d+t, h+t+t], false, t, "x");

roundedcube([w, d+t, h+t+t], false, t, "x");

translate([0,d+t,0])
rotate([0,0,90])
roundedcube([w, d+t, h+t+t], false, t, "x");
}

translate([w,0,0])
color("blue")
roundedcube([w, d+t, h+t+t], false, t, "x");

module plate()
{
    f=t*2;
    color("green")
translate([-d+f, t+f, t])
cube([w+d, w+d, h]);
}

plate();

difference()
{
corner();



plate();
}