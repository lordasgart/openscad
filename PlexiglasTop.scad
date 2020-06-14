$fn=360;

$s = 4;
$h = 36;
$t=$s*2;

module side()
{
cylinder(h=$h,r1=$t/2,r2=$t/2);
translate([0,-$t/2,0])
cube([$h,$t,$h]);
}

module complete()
{
translate([$h,$t-$s/2,0])
cylinder(h=$h,r1=$t+$s/2,r2=$t+$s/2);

side();

translate([0,$t+$s,0])
side();
}

difference()
{
complete();

color("red")
translate([0,$t-$s,0])
cube([$h-$s/2,$s,$h]);

color("blue")
translate([$h-$s/2,$t-$s/2,0])
cylinder(h=$h,r1=$s/2,r2=$s/2);
}