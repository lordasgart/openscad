$fn=72;

h=15;
t=1.6;
d=h/2;

cube([100, d+t, t]);

translate([0,0,t])
cube([100, t, h]);

translate([0,0,h+t])
cube([100, d+t, t]);


module brett()
{
color("red")
translate([0,t,t])
cube([200,200,h]);
}

module cut()
{
color("yellow")
translate([-d-t,t+d,0])
cube([200,200,h+t+t]);
}


difference()
{
c1=d+t;
translate([0,c1,0])
cylinder(h+t+t, r=c1);

translate([0,d+t,t])
cylinder(h, r=d);

brett();
    cut();
}
