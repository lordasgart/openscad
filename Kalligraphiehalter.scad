//Kalligraphiehalter

$fn=36;

h=22.5;
d=10.8;
t=3;

w=d*6;
dp=h+t*2;

difference()
{
    cube([w, dp, h+t]);
    
    translate([w/4,dp/2,t])
    cylinder(h=h, d=d);
    
    translate([w/2,dp/2,t])
    cylinder(h=h, d=d);
    
    translate([w/2+w/4,dp/2,t])
    cylinder(h=h, d=d);
}
