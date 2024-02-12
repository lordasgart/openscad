//Postillon
w=102;
h=129;
t=1.6;
z=w/8;

difference()
{
    
    color("blue")
cube([w+t+t,h+t+t,z+t]);
    
translate([t,t,t])
cube([w,h,z]);


}