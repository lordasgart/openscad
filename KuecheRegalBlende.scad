h=15;
t=1.6;
d=h/2;

cube([100, h/2+t, t]);

translate([0,0,t])
cube([100, t, h]);

translate([0,0,h+t])
cube([100, h/2+t, t]);

difference()
{
c1=d+t;
translate([0,c1,0])
cylinder(h+t+t, r=c1);

translate([0,d+t,t])
cylinder(h+t+t, r=d);
}