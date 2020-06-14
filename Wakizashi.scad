$outer_width = 57;
$inner_width = 42;
$holderwidth = ($outer_width - $inner_width) / 2;
$schwertdicke = 14; //schwertdicke ist dicke an der Stelle bis zur Wand (dickste Stelle des Schwertes)
$thickness = 2;
module connector() {
hull() {
    
    translate([$holderwidth / 4,$holderwidth / 4,$thickness])
linear_extrude(height = 0.1)
square([$holderwidth/2, $holderwidth/2]);

translate([0,0,$schwertdicke+$thickness])
linear_extrude(height = 0.1)
square([$holderwidth, $holderwidth]);
}
}

connector();
translate([$inner_width+$holderwidth,0,0])
connector();

linear_extrude(height = $thickness)
square([$outer_width, $holderwidth]);
