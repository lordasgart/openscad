$fn=36;
//Spare2

h=20.5;
i=29;
j=9.5;
k=3.5;

difference()
{
cube([h,i,0.3]);

translate([j,6.5,0])
cylinder(h=1,d1=k,d2=k);
}
