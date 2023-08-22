a1=345;
a2=378;
ad=a2-a1;
b=30;
h=15.75; //Hoehe Regalbrett
t=2.0;
kb=25+2;
hk=kb*2;
af=15;//Auflagefläche
wf=15;

module piece()
{
color("green")
translate([0,a2-a1,-hk+h])
cube([t,a1,hk]);

linear_extrude(h)
polygon([[0,a2-a1],[0,a2],[b,0]]);

color("blue")
translate([0,0,-t])
linear_extrude(t)
polygon([[0,ad+af],[0,a2],[af,a2],[b+af,ad+af]]);

color("red")
translate([0,ad+af,0])
rotate([270,90,0])
linear_extrude(a2-ad-af)
polygon([[t,-t],[t+wf,-t],[t,-t-wf]]);
}

module cut(yy)
{
color("yellow")
translate([0,0,-hk])
cube([b+af,yy,hk+h]);
}

difference()
{
    piece();
    
    yyy=ad+af+hk;
    
    //translate([0,ad+af+hk,0])
    //cut(a2);
    
    cut(yyy);

    translate([0,yyy*2,0])
    cut(yyy);

    //translate([0,yyy*2,0])
    //cut(yyy);

    //hinten
    translate([0,a2-yyy,0])
    cut(a2);
}