a=20;
b=106;
c=74;

t=2;

difference()
{
color("red")
translate([0,0,0])
cube([b+t+t,a+t+t,c/2]);

translate([t,t,t])
cube([b,a,c]);
}