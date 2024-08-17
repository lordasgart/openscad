$fn=36;

//Tickness
t=1.4;

/* Copy from here */

//Schraube oben durchmesser
//sod=5;
sod=7;
//Schraube unten durchmesser
//sud=2;
sud=3.5;
//Schraubenkopflänge
skl=4;
//Schraube Total
st=16.5;
//

module Schraube()
{
    color("red")
    translate([0,0,0])
    rotate([0,0,0])
    {
        cylinder(skl, d1=sod,d2=sud);
        cylinder(st, d=sud);
    }
}

//schraube();
