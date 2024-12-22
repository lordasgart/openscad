sk=5;
d=12.5-8.15;
$fn=90;


difference()
{
cube([50,50,d]);

translate([10,10,0])
cylinder(h=d, d1=sk, d2=2);
    
    translate([10,40,0])
cylinder(h=d, d1=sk, d2=2);
    
    
    translate([40,10,0])
cylinder(h=d, d1=sk, d2=2);
    
    
    translate([40,40,0])
cylinder(h=d, d1=sk, d2=2);
    
    
}