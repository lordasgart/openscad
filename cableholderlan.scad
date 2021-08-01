
$fn=180;
w=40;
h=40;
wz=w*1.5;

t=2.54;
th=2.5;

module wand()
{
color("red")
cube([w,h/2,t]);

translate([w/2,w/2,0])
cylinder(h=t,d=w);
}

//cube([w,t,h]);

difference()
{
translate([h/2,-22.34+th,0])
cylinder(h=h,d=wz);

translate([wz-w-wz/2,-wz,0])
cube([wz,wz,h]);
    
    translate([-w,0,0])
cube([w,th,h]);

translate([w,0,0])
cube([w,th,h]);
}

wand();

translate([0,0,h-t])
wand();

translate([w/2,h/2,0])
color("blue")
cylinder(h=h,d=5);
