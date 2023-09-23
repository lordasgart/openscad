$fn=180;

t=1.2;
//Tiefe in die Platte (ohne Zusatz)
d=10;
//Länge die wir brauchen
w=d*2; //für Ecke
//w=44; //für Rand (manuell)
//Hoehe der Platte (ohne Zusatz)
h=5.25;

//Ich kann ja nicht ganz raus mit ner Spitzen Ecke, hier kommt die Variable f ins Spiel, die das ganze weiter nach innen verschiebt:
f=t*2;

b=0; //Ecke
//b=1; //Rand

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
roundedcube([w+f, d+t, h+t+t], false, t, "x");

roundedcube([w+f, d+t, h+t+t], false, t, "x");

translate([0,d+t,0])
rotate([0,0,90])
roundedcube([w+f, d+t, h+t+t], false, t, "x");
}

module rand()
{
    translate([0,0,0])
    color("blue")
    roundedcube([w, d+t, h+t+t], false, t, "x");
}

module platecorner()
{
    color("green")
    translate([-d+f, t+f, t])
    cube([w+d, w+d, h]);
}

module platerand()
{
    color("yellow")
    translate([0, t+f, t])
    cube([w+d, w+d, h]);
}

if (b == 0)
{
    difference()
    {    
        corner();
        platecorner();
    }
}
else
{
    difference()
    {    
        rand();
        platerand();
    }
}