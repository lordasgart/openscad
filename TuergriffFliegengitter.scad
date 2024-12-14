//TuergriffFliegengitter

$fn=72;

w=120;
t=2;
d1=4;
d2=8;
h=10;

module griff() {
cube([w,t,h]);

translate([0,-d1,-h])
cube([w,d1,h*3]);

translate([0,-d2-d1,-h*2])
cube([w,d2,h*5]);
}

module loch() {
    rotate([90,0,0])
    color("blue")
    cylinder(h=t+d1+d2, r=5);
}

ls=6;
lsg=17;

module schraube() {
translate([0,t,h/2])
rotate([90,0,0])
color("red")
cylinder(h=t+d1+d2, r1=0.8, r2=8);
}

module schrauben() {
    translate([8+t*3,0,0])
    schraube();
    
    translate([35,0,0])
    schraube();
    
    translate([w-8-t*3,0,0])
    schraube();
    
    translate([w-35,0,0])
    schraube();
    
    translate([w/2,0,0])
    schraube();
}

difference() {
   griff();
    schrauben();
}