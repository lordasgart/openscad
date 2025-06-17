x=152;
y=107;
z=10;

t=2;

include <roundedcorners.scad>;

difference() {
    roundedcube([x+t*4, y+t*4, z+t], false, t, "xy");
    translate([t,t,t])
    roundedcube([x+t*2, y+t*2, z], false, t, "xy");
}