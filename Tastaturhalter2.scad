$t=3.2;
$d=21-$t; 
$h1=20;
$h2=$h1*2;
$b=14;
$s=2.5;
$fn=360;
$i=360;
$d2=4.8;
$dh=2.0;

module bodenplatte()
{
    linear_extrude(height=$t)
    square([$b,$d]);
}

module rueckseite()
{
    rotate([90,0,0])
    linear_extrude(height=$t)
    square([$b,$h2]);
}

module vorderseite($shift)
{
    //rundung
    translate([0,$d+$t/2,$h1-$shift])
    rotate([0,90,0])
    cylinder(h=$b,r1=$t/2,r2=$t/2);
    
    translate([0,$d+$t,0])
    rotate([90,0,0])
    linear_extrude(height=$t)
    square([$b,$h1-$shift]);
}

module loch()
{
    color("gray")
    translate([$b/2,0,$h1+$h1/2])
    rotate([90,0,0])
    linear_extrude(height=$t)
    circle(d=$s,$fn=$i);
}

module john_cena()
{
    color("white")
    translate([$b/2,-$t+$dh,$h1+$h1/2])
    rotate([270,0,0])
    cylinder($dh,d1=$s,d2=$d2,$fn=$i);
}

module rueckseite_mit_loch()
{
    difference()
    {
        rueckseite();
        loch();
        john_cena();
    }
}

module innercircle()
{
translate([0,$d/2,0])
rotate([0,90,0])
cylinder(h=$b,r1=$d/2,r2=$d/2);
}

module outercircle()
{
translate([0,$d/2,0])
rotate([0,90,0])
cylinder(h=$b,r1=$d/2+$t,r2=$d/2+$t);
}

//bodenplatte();
difference()
{
    outercircle();
    innercircle();
    cube([$b,$d,$d]);
}

vorderseite(0);
rueckseite_mit_loch();
