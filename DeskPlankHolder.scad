include <PrusaImport.scad>

//Thickness
t=wt8; //8 lines, as the connector on the desk is about 3.3 this is a good value not to scratch the wood with attached connector...

spar=14;
wood=18;

s1=5;
s2=3;

z=7; //Zusätzliche Tiefe für die Platte
//z=11 +4 für nächste Stufe

//left
translate([0,0,0+z])
cube([t,spar,spar]);

//top
translate([0,0,spar+z])
cube([spar+t+t,spar,t]);

//right
translate([spar+t,0,0])
cube([t,spar,spar+z]);

//bottom
module bottom()
{
color("blue")
translate([spar+t+t,0,0])
cube([wood, spar, t]);
}

module schraube()
{
    translate([spar+t+t+(wood/2),spar/2,0])
    color("red")
    rotate([0,0,0])
    cylinder(h=t, d1=s1, d2=s2);
}

difference()
{
bottom();
schraube();
}