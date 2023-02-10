$fn=32;

h=45;
r1=85/2;
r2=55/2;
t=1.26;


difference()
{
    cylinder(h,r1,r2);
    cylinder(h,r1-t,r2-t);
}
