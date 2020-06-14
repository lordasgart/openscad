$dia = 24;
$ldia = 23;
$r = $dia / 2;
$schwertdicke = 40;
$height = 20;
$thickness = 2;

module innerconnectorcutter()
{
hull() {
linear_extrude(height = 0.1)
circle(d=$ldia,$fn=360); //Das muss ich an der Stelle $schwertdicke messen

translate([0,0,$height])
linear_extrude(height = 0.1)
circle(d=$dia,$fn=360);
}
}

module outerconnector()
{
hull() {
linear_extrude(height = 0.1)
circle(d=$ldia+$thickness*2,$fn=360);

translate([0,0,$height])
linear_extrude(height = 0.1)
circle(d=$dia+$thickness*2,$fn=360);
}
}

module fullconnector()
{
difference()
{
outerconnector();
innerconnectorcutter();
}
}

difference() {
fullconnector();

translate([-$r-$thickness,-$r-$thickness,0])
linear_extrude(height = $height+0.1)
square([$dia+$thickness*2,$dia-($dia/2)-$thickness*2]);
}

linear_extrude(height = $height+0.1)
translate([-$r-$thickness,$r,0])
square([$dia+$thickness*2, ($schwertdicke-$dia)/2]);