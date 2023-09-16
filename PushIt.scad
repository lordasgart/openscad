$fn=24;

t=0.6;

zitat="Push It";
urheber="Salt-N-Pepa";

//https://printingit3d.com/best-fonts-to-use-for-3d-printing/
f="Arial Rounded MT Bold:style=Regular";

sz=8;
su=6;

d=-6;
w=60;
h=40;

x=20;
y=7;

linear_extrude(t*2)
text(zitat, size=sz, halign="center", font=f);

translate([0,-20,0])
linear_extrude(t)
text(urheber, size=su, halign="center", font=f);

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



difference()
{

translate([0,d,-t])
cube([w,h-d,t], center=true);


translate([x,-y,0])
schraube();

translate([-x,-y,0])
schraube();
}