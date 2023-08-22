a1=345;
a2=378;
ad=a2-a1;
b=30;
h=15.75; //Hoehe Regalbrett
t=2.4;
kb=25+2;
hk=kb*2;
af=15;//Auflagefläche

color("green")
translate([0,a2-a1,-hk+h])
cube([t,a1,hk]);

linear_extrude(h)
polygon([[0,a2-a1],[0,a2],[b,0]]);

color("blue")
translate([0,0,-t])
linear_extrude(t)
polygon([[0,ad+af],[0,a2],[af,a2],[b+af,ad+af]]);