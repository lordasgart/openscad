//78x10 Samsung Galaxy S9+
//3x5(4) LED weiss klein

$fn=360;
$d=21;
$r=$d/2;
$t=2.4;
$t2=$t*2;
$h=161; //160 + Toleranz
$b=92.5; //78 + Toleranz

module roundedge($tpr)
{
rotate([90,0,0])
cylinder(h=$d+$tpr,r1=$r+$tpr/2,r2=$r+$tpr/2);
}

module galaxys9($tp)
{
color("blue")
translate([$r+$tp/2,0,0])
cube([$b-$r*2,$d+$tp,$h+$tp]); //Samsung Galaxy S9+

translate([0,0,$r+$tp/2])
cube([$b+$tp,$d+$tp,$h-$r*2]); //Samsung Galaxy S9+

color("red")
translate([$r+$tp/2,$d+$tp,$r+$tp/2])
roundedge($tp);

color("red")
translate([$r+$tp/2,$d+$tp,$h-$r+$tp/2])
roundedge($tp);

color("red")
translate([$b-$r+$tp/2,$d+$tp,$h-$r+$tp/2])
roundedge($tp);

color("red")
translate([$b-$r+$tp/2,$d+$tp,$r+$tp/2])
roundedge($tp);
}

difference()
{
translate([0,0,0])
galaxys9($t2);
    
translate([$t,$t,$t])
galaxys9(0);

color("white")
translate([0,0,($h+$t2)/2])
cube([$b+$t2,$d+$t2,($h+$t2)/2]);
    
color("pink")
translate([0,-$t,($h+$t2)/3])
cube([$b+$t2,$d+$t2,($h+$t2)/2]);
    
color("gray")
translate([$t*4,-$t,$t*4])
cube([$b-$t*6,$d+$t2,($h+$t2)/2]);
    
color("black")
translate([$b/2+$t2/2,$d+$t2,$h/2.4])
rotate([90,0,0])
cylinder(h=$t,r1=2,r2=2);
}

