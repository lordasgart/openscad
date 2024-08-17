//Universal Remote Control Holder
//UniversalRemoteControlHolder.scad

include <Schraube.scad>

w=45;
d=21;
h=75;

t=2.5;

//Front left and right
f=10;

module outercube()
{
    cube([w+t+t,d+t+t,h+t]);
}

//outercube();

module innercube()
{
    cube([w,d,h]);
}

module frontslot()
{
    cube([w-f-f,t+d,h+t]);
}

module schraube()
{
    translate([(w+t+t)/2,t+d,(h+t)/2])
    rotate([270,0,0])
    Schraube();
}

difference()
{
    outercube();
    
    translate([t,t,t])
    innercube();
    
    translate([t+f,0,0])
    frontslot();
    
    schraube();
}