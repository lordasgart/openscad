//3x5(4) LED weiss klein

$nr=12;//anzahl der leds

$fn=24;
$d=3;
$r=$d/2;
$h=5;
$hk=4;

$t=2;

$ledabstand = 3;
$leistenlaenge = ($d+$ledabstand)*$nr +$ledabstand;
$leistenbreite = $d+$ledabstand*2;
$leistenhoehe = $d;

module whiteled()
{
color("white")
led();
}

module led()
{
translate([0,0,0])
cylinder(h=$hk-$r/2,r1=$r,r2=$r);
translate([0,0,$hk-$r/2])
sphere(r = $r);
}

module ledrow()
{
color("gray")
translate([-$r,-$r,0])
cube([$leistenlaenge,$leistenbreite,$leistenhoehe]);

for (i =[0:$nr-1]){
translate([$ledabstand+($d+$ledabstand)*i,$ledabstand,0])
whiteled();    
}
}

ledrow();
translate([0,$leistenbreite,0])
ledrow();

color("blue")
translate([-$r,-$r-$t,0])
cube([$leistenlaenge,$t,$leistenhoehe+$d]);

color("green")
translate([-$ledabstand,-$r-$t,-20])
cube([$t,($leistenbreite+$t)*2,$leistenhoehe+20]);