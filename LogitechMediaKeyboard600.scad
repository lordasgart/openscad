//Logitech Media Keyboard 600

$fn=36;

//Breite
width=25;

//Durchmesser Löcher
d=2.3;

//Länge
length=18*2;

//Feder und/oder Spalte
f=2;

//Feder Länge
fl=10;

//Tichkness
t=d;

module part()
{
translate([0,0,d/2])
rotate([0,90,0])
cylinder(width+2*f, d/2, d/2);

translate([f,0,0])
cube([width, length, t]);
}

module cuts()
{
translate([f*2,-d/2,0])
color("red")
cube([f,fl*1.66666,t]);

translate([width-f,-d/2,0])
color("red")
cube([f,fl*1.66666,t]);
}

difference() {
    part();
    cuts();
}
