$plate_height = 1.8;
$inner_height = 3.6*2.5;
$d2=33.2;

linear_extrude(height = 1.8)
circle(d = 38, $fn=360);


translate([0,0,$plate_height])
difference()
{
    cylinder(h=$inner_height, d1 = 34.4, d2=$d2, $fn = 360);
    
    linear_extrude(height = $inner_height)
    circle(d = $d2-$plate_height, $fn=360);
}
