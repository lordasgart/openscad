//Quer
q=15;
//Breite Fließe
bf=150;
//Dicke
d=1.6;
//Tiefe Hoehe
th=q/2;
//Tiefe
t=th-d;
//Hoehe
h=th;

module leiste()
{
rotate([90,0,90])
linear_extrude(bf)
polygon([[-d,0],[0,0],[0,d]]);

cube([bf,t,d]);

translate([0,t,0])
rotate([45,0,0])
cube([bf,q,d]);

translate([0,t+sin(45)*q-d,sin(45)*q])
cube([bf,d,h-d]);

translate([bf,t+sin(45)*q,sin(45)*q+h-d])
rotate([270,90,90])
linear_extrude(bf)
polygon([[-d,0],[0,0],[0,d]]);
}

leiste();
module leisteecke()
{
translate([q+d,-bf/2,0])
rotate([0,0,90])
leiste();
}

module leiste90()
{
translate([0,-bf,0])
rotate([0,0,90])
leiste();
}
//leiste90();