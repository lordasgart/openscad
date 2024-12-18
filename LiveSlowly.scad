$fn=24;

t=0.6;

zitat="To live long, live slowly.";
urheber="Marcus Tullius Cicero";

linear_extrude(t*2)
text(zitat, size=8, halign="center");

translate([0,-20,0])
linear_extrude(t)
text(urheber, size=6, halign="center");

/* Copy from here */

//Schraube oben durchmesser
sod=5;
//Schraube unten durchmesser
sud=2;
//Schraubenkopflänge
skl=t;

module schraube()
{
    color("red")
    translate([0,0,-t/2])
    rotate([180,0,0])
    cylinder(skl, d1=sod,d2=sud);
}

x=48;
y=17.5;

difference()
{
d=-5;
translate([0,d,-t])
cube([120,45-d,t], center=true);


translate([x,-y,0])
schraube();

translate([-x,-y,0])
schraube();
}