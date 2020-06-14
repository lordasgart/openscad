$k1=2;
$k2=4;
$i=36;//360;

$t1 = 4;
$t2 = 2;
$depth = 20;

module corner()
{
cube([$t1,$depth,$depth]);

translate([$t1+$k2/2,0,$t1+$k2/2])
rotate([90,0,0])
circle(d=$k2,$fn=$i); //Platzhalter für Kabeldurchmesser

translate([$t1+$k1/2,$depth,$t1+$k1/2])
rotate([90,0,0])
circle(d=$k1,$fn=$i); //Platzhalter für Kabeldurchmesser

cube([$depth,$depth,$t1]);
}

module test()
{
$rot=6;
rotate([-$rot,0,$rot])
translate([$depth-$k2-1,-3,0])
rotate([0,-45,0])
cube([$t2,$depth,$depth]);
}


difference()
{
    corner();

translate([$t1+$k2,0,$t2])
cube([$t2,$depth,$t2]);
}