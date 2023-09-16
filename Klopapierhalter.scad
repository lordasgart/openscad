//Seite Dreieck
s=170;
//Klebeband
k=25+2;
//Thickness
t=1.8;
//kt
kt=40;

module halter()
{
linear_extrude(t)
polygon([[0,0],[s,0],[0,s]]);

translate([kt,0,0])
cube([k*2,t,k*2]);

translate([0,kt,0])
cube([t,k*2,k*2]);
}

module verbinder()
{
color("green")
linear_extrude(k*2)
polygon([[0,0],[t,0],[0,t]]);
}

halter();

translate([t,kt,t])
rotate([270,270,0])
verbinder();

rotate([90,0,0])
translate([kt,t,0-t])
rotate([0,90,0])
verbinder();
