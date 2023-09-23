$fn=36;

d=26.8;//-26.4
d1=d;
h=4.2;//3-4
t=1.2;
h2=h+t;
hx=h/4;


difference()
{
cylinder(h=h2, d=d+t+t);


color("green")
translate([0,0,t+hx])
cylinder(h=h*5, d=d);

color("red")
translate([0,0,t])
cylinder(h=hx, d1=d1-t-t, d2=d1);
}

module spheretest()
{
color("red")
translate([0,0,h])
sphere(d=d);
}
