/* Außen */
//Äußerster Durchmesser
d3 = 47;
//Durchmesser äußerer Ring
d2 = 20;
//Durchmesser innerer Ring
d1 = 14.3;
//Abstand Kanten Sechseck
hex = 8.2;
//=>Innenkreisradius des Sechseck + Toleranz
ri = hex/2 + 0.4;

/* Innen */
//Durchmesser Innenteil
i1=14;
//Durchmesser fiktiver Kreis von Griff
ig=15.8;
//Thickness Wand
t=2.3;
//Höhe oberer Teil
ho=10;
//Höhe Total
ht=23.5;
//Höhe unten
hu=ht-ho;

$fn=72;

include <Scripts/Polygon.scad>;

module connector()
{
  difference()
  {
    cylinder(h=hu,d1=i1,d2=i1);

    translate([0,0,hu/2])
    Hexagon(A=ri,h=hu);
  }
}

translate([0,0,ho])
connector();

//circle(d=d3);
linear_extrude(height=ho)
{
hull() {
color("blue") Triangle(R=d3/2);

//color("green") Triangle(R=d3/2-ig/2);

translate([15.6,0,0])
color("red")
circle(d=ig);

translate([-7.8,13.5,0])
color("red")
circle(d=ig);

translate([-7.8,-13.5,0])
color("red")
circle(d=ig);
}
}