// Tuerkeil 5x2
$x=25;
$y=50;
$z=$y;

$x2=$x/2;
$y2=$y/2;
$z2=$z/2;

difference()
{
linear_extrude(height = $z)
polygon([[0,0],[$y,0],[$y,$x]]);

color("red")
translate([$y2/2,0,$z2/2])
linear_extrude(height = $z2)
polygon([[0,0],[$y2*1.5,0],[$y2*1.5,$x2]]);
}