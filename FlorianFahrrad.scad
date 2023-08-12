$fn=36;

a=10.3;

b=9.2;
c=10.2;

ds=6.4;

d=20;

module holm()
{
rotate([0,-10,0])
translate([-15,0,hk])
rotate([0,90,0])
cylinder(h=100, d=a);
}

//abstandhalte für holm winkel einstellung
//cube([1,1,b]);
//translate([ds,0,0])
//cube([1,1,c]);

hk=8;
bk=ds*3;
//dk=d+a+ds*2;
dk=20+ds/2;

mirror([1,0,0])
difference()
{
cube([bk,dk,hk]);
    
translate([0,ds,0])
holm();
    
    schraube();
}

module schraube()
{
translate([bk/2,(-ds/2)+20,0])
color("red")
cylinder(h=hk, d=ds);
}
