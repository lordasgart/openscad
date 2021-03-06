$outer_width = 75;
$inner_width = 32;
$holderwidth = ($outer_width - $inner_width) / 2;
$schwertdicke = 27; //schwertdicke ist dicke an der Stelle bis zur Wand (dickste Stelle des Schwertes)
$thickness = 2;
module connector() {
hull() {
    
    translate([$holderwidth / 4,$holderwidth / 4,$thickness])
linear_extrude(height = 0.1)
square([$holderwidth/2, $holderwidth/4]);

translate([0,0,$schwertdicke+$thickness])
linear_extrude(height = 0.1)
square([$holderwidth, $holderwidth/2]);
}
}

connector();
translate([$inner_width+$holderwidth,0,0])
connector();

linear_extrude(height = $thickness)
square([$outer_width, $holderwidth/1.5]);
