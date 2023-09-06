//Tickness
t=1.4;

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
    translate([0,0,0])
    rotate([0,0,0])
    cylinder(skl, d1=sod,d2=sud);
}

schraube();
