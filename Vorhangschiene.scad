difference()
{

cube([28,9,50]);
    
translate([28-4-6.4,0,0])
cube([6.4,6.4,50]);
    
    translate([28-4-6.4-2,2,0])
cube([6.4+2+2,6.4-2,50]);
}