
translate([0,0,5.9])
import("/home/lordasgart/Projects/lordasgart/openscad/gardena.stl");

$ldia=38.2; //large dia of connector segment
$sdia=$ldia-2.49; //small dia of connector segment
$idia=$sdia-2.49; //inner dia, waterflow channel dia
$i=90; //final render accuracy circle: 360
$h=50; //total length
$sh=9; //segment_height
$l=0.1; //linear_extrude height for hull

module water_channel()
{
linear_extrude(height = $h) 
circle(d=$idia,$fn=$i);
}

module connector_segment()
{
hull() {
linear_extrude(height = $l)
circle(d=$sdia,$fn=$i);

translate([0,0,$sh])
linear_extrude(height = $l)
circle(d=$ldia,$fn=$i);
}
}

adapterfactor=0.49;

module water_channel_in()
{
hull()
{
translate([0,0,$sh*4])
linear_extrude(height = $l)
circle(d=$idia,$fn=$i);

translate([0,0,$h])
linear_extrude(height = $l)
circle(d=$idia*adapterfactor,$fn=$i);
}
}

module water_channel_outer()
{
hull()
{
translate([0,0,$sh*4])
linear_extrude(height = $l)
circle(d=$ldia,$fn=$i);

translate([0,0,$h])
linear_extrude(height = $l)
circle(d=$ldia*adapterfactor,$fn=$i);
}
}


module pipe()
{
connector_segment();
translate([0,0,$sh])
connector_segment();
translate([0,0,$sh*2])
connector_segment();
//translate([0,0,$sh*3])
//connector_segment();
//translate([0,0,$sh*4])
//connector_segment();
}

difference()
{
    water_channel_outer();
    water_channel_in();
}

//water_channel_in();x

difference()
{
    translate([0,0,$sh])
    pipe();
    
water_channel();
}
