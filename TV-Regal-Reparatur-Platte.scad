$fn=36;

ls=12.5;
s1=5;
s2=3;
db=9.5;

gs=42;

d=ls-(db/2);
//d=db;

module platte()
{
cube([gs,gs,d]);
}

module schraube()
{
translate([0,0,d])
color("blue")
rotate([0,180,0])
cylinder(h=d, d1=s1, d2=s2);
}
//sx=s1;
sx=db/2;
module schrauben()
{
    translate([sx,sx,0])
    schraube();
    
    translate([gs-sx,sx,0])
    schraube();
    
    translate([sx,gs-sx,0])
    schraube();
    
    translate([gs-sx,gs-sx,0])
    schraube();
}

difference()
{
    platte();
    schrauben();
}

