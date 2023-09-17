//SolarSchraubenAdapter2

$fn=72;

y=34.5;
y2=14.2;
to=0.2;
h1=14.8+to;
y1=y-y2+to;
w=28.2;

hs=52;
hs3=2.8;
hs2=5.5-hs3;
hs1=hs-hs2-hs3;

d1=7.5;
d2=9.7;
d3=20;
d4=16;

module klotz()
{
translate([w,0,0])
rotate([0,270,0])
linear_extrude(w)
polygon([[0,0],[h1,y2],[0,y2]]);
}

module schraube()
{
    cylinder(h=hs1,d=d1);
    
    translate([0,0,hs1])
    cylinder(h=hs2, d1=d1, d2=d2);
    
    translate([0,0,hs1+hs2])
    cylinder(h=hs3, d1=d3, d2=d4);
}

module sch2()
{
    rotate([46.3,0,0])
    translate([w/2,10.35,-49.3])
    color("green")
    schraube();
}

difference()
{
    klotz();
    sch2();
}
