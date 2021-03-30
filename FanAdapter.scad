//difference()
//{
//  translate([16.5, 2.5, 10.5])
//  roundedRect([33, 5, 21], 0);
//    
//  translate([16.5, 2.5, 10.5])
//  roundedRect([31, 3, 25], 1);
//}
//
module roundedRect(size, radius)  // more elegant version
 linear_extrude(height = size.z, center=true)
  offset(radius) offset(-radius)
   square([size.x, size.y], center = true);

difference()
{
    translate([-8.35,0,0])
    cube([50,10,10]);

    translate([1.75,0,1.5])
    cube([5.5,3,7]);
    
    translate([26.05,0,1.5])
    cube([5.5,3,7]);
    
    translate([3,3,1.5])
    cube([3,7,7]);
    
    translate([27.3,3,1.5])
    cube([3,7,7]);
}

translate([-8.35,0,10])
cube([50,10,11]);

translate([-1.35,-14,21])
cube([10,24,3]);

translate([24.65,-14,21])
cube([10,24,3]);