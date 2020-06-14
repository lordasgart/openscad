$idia=27.0; //inner dia, waterflow channel dia
$sdia=30.6; //small dia of connector segment
$ldia=32.4; //large dia of connector segment
$i=360; //final render accuracy circle: 360
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

module water_channel_in()
{
hull()
{
translate([0,0,$sh*4])
linear_extrude(height = $l)
circle(d=$idia,$fn=$i);

translate([0,0,$h])
linear_extrude(height = $l)
circle(d=$idia*2,$fn=$i);
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
circle(d=$ldia*2,$fn=$i);
}
}

module pipe()
{
connector_segment();
translate([0,0,$sh])
connector_segment();
translate([0,0,$sh*2])
connector_segment();
translate([0,0,$sh*3])
connector_segment();
//translate([0,0,$sh*4])
//connector_segment();
}

difference()
{
    water_channel_outer();
    water_channel_in();
}

difference()
{
    pipe();
    
water_channel();
}