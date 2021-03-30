h=10;
ph=h/2;

$fn=36;

d1=48;
x1=71;
y1=-28;

d2=48;
x2=-76;
y2=-28;

module bike()
{
linear_extrude(height = h)
import("/home/lordasgart/Nextcloud/Pictures/SVG/suzuki-gsxr125-2017b-simplify1.svg", center = true);

color("red")
//translate([40,0,0])
//cube([60,30,h/2]);
linear_extrude(height = ph)
polygon([[20,0],[100,0],[70,50]]);

color("blue")
linear_extrude(height = ph)
polygon([[90,0],[110,0],[100,30],[80,30]]);

color("orange")
linear_extrude(height = ph)
polygon([[90,0],[110,0],[119.35,-12.41],[90,-30]]);


}

difference()
{
    
bike();
  color("pink")
translate([x1,y1,0])
linear_extrude(height = h)
circle(d=d1);

color("pink")
translate([x2,y2,0])
linear_extrude(height = h)
circle(d=d2);  
    
}
