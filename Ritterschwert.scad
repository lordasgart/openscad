$width = 88; // noch genau ausmessen, passt
$dia = $width / 2; //ne leichte rundung
$schwertdicke = 33; //noch genau messen, passt
$thick_holder = $schwertdicke/2;
$thickness = 2;



translate([-$dia/2,$dia/2-$thick_holder,0])
linear_extrude(height=$thickness)
square([$dia+$width,$thick_holder]);



translate([0,0,$thickness])
difference() {

holders() ;
    
linear_extrude(height=$schwertdicke+0.1)
translate([-$dia/2, -$dia/2-$thick_holder, 0])
square([$dia+$width,$dia]);

}

module holders() 
{
    hull() {
    
    linear_extrude(height=0.1)
circle(d=$dia-$thick_holder);
    
    translate([0,0,$schwertdicke])
linear_extrude(height=0.1)
circle(d=$dia);
}
hull() {
translate([$width,0,0])
linear_extrude(height=0.1)
circle(d=$dia-$thick_holder);

translate([$width,0,$schwertdicke])
linear_extrude(height=0.1)
circle(d=$dia);
}
}