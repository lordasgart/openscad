$dia = 32;
$r = $dia / 2;
$schwertdicke = 40; //noch messen !!!
$thickness = 2;

module innerconnectorcutter()
{
hull() {
linear_extrude(height = 0.1)
circle(d=$r, $fn=360);

translate([0,0,$schwertdicke])
linear_extrude(height = 0.1)
circle(d=$dia, $fn=360);
}
}

module outerconnector()
{
hull() {
linear_extrude(height = 0.1)
circle(d=$r+$thickness*2, $fn=360);

translate([0,0,$schwertdicke])
linear_extrude(height = 0.1)
circle(d=$dia+$thickness*2, $fn=360);
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
linear_extrude(height = $schwertdicke+0.1)
square([$dia+$thickness*2,$dia-($dia/2)-$thickness*2]);
}

