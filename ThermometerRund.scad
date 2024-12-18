//Thickness
t=2;
//Durchmesser Kreis
dk=42.4;
//Durchmesser Kreis außen
dka=dk+t*2;
//Breite Klebeband + Tolerant
bkl=(25+2)*2;
//Tiefe Kreis
tk=16.3;

$fn=14;

difference()
{
color("green")
cylinder(h=tk, d=dka);

cylinder(h=tk, d=dk);
}

color("blue")
translate([0,0,-t])
//cube([bkl, bkl, t], center=true);
cylinder(h=t, d=dka);