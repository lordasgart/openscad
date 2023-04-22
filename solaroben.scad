$fn=36;
//Durchmesser Beilagscheibe groß
dmbg=16;
a=64;
b=51;
c=38;
d=10;
e=6;
f=1;
h=d*2;
t=4;

difference() {
    cube([a,h,t]);
    
    translate([(a-b)/2,0,0])
    translate([e/2,h/2,0])
    cylinder(h=t, d=e);
    
    translate([-(a-b)/2,0,0])
    translate([a-e/2,h/2,0])
    cylinder(h=t, d=f);
}