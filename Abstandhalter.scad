module schraube()
{

linear_extrude(height = 25)
circle(r=2, $fn=360) ;

translate([0,0,25])//10 weniger als 35 d.h. bei 1.8 brettdicke geht es 1.0 rein
cylinder(h=4, r2=4, r1=2, $fn=360);
}

difference() {
cylinder(h=29, r2=6, r1=6, $fn=360);
schraube();
}