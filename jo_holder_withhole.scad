$holder_tickness = 5;

$diameter_jo = 26.2;
$outer_diameter_jo = $diameter_jo + $holder_tickness * 2;

$i = 36;

difference()
{
    import("jo_holder_nohole.stl");
    
    
translate([-8.5,23.1,$diameter_jo/2])
rotate([270,0,0])
cylinder(h=$holder_tickness, d1 = 4.5, d2 = 4.5, $fn = $i);
    
    
    translate([-8.5,23.1,$diameter_jo/2])
    rotate([270,0,0])
cylinder(h=3, d1 = 9, d2 = 4.5, $fn = $i);
}
