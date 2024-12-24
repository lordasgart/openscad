//BruceWillis
t=1.8;
rotate([-90,0,0])
difference()
{
cube([33+t*2,20+t,23+t*2]);
  translate([t,0,t])
cube([33,20,23]);
 
}