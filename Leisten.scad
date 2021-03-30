t=0.9; //0.3 + 3*0.2 //also 0.3 + 0.6 = 0.9
w=64;
h=8;
$fn=36;

cube([w,h,t]); //unten

translate([0,0,t/2])
color("green")
rotate([0,90,0])
cylinder(h=w,r=t/2);

//verbinder
//translate([0,h,0]) 
//color("red")
//cube([w,t,t]);

difference() {
//verbinder abgerundet als zylinder
translate([0,h,t])
rotate([0,90,0])
color("blue")
cylinder(h=w,r=t);

translate([0,h-t,t]) 
color("yellow")
cube([w,t,t]);
}


translate([0,h,t]) //hinten
cube([w,t,h]);

translate([0,h+t/2,h+t])
color("green")
rotate([0,90,0])
cylinder(h=w,r=t/2);