$fn=72;
//Toleranz
to=1;
//Breite Klebeband
bk=25+to*2;
//Hoehe Haken
hh=(bk*2)+(to*2);
//Dicke
t=3.6;
//Dicke Cylinder
dc=bk;
//Breite Cylinder
hc=bk/4;
//Dicke Cylinder2
dc2=dc-t*2;
//Breite Cylinder2
hc2=hc;

m=bk/2-hc/2;

module klebeflaeche()
{
    cube([bk,hh,t]);
}

klebeflaeche();

difference()
{
translate([m,0,dc/2])
rotate([0,90,0])
cylinder(h=hc, d=dc);

color("blue")
translate([m,0,dc/2])
rotate([0,90,0])
cylinder(h=hc2, d=dc2);

color("red")
translate([m,0,t])
cube([hc,dc2,dc2+t]);
}