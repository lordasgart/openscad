$t=2;
$d=21-$t; 
$h1=20;
$h2=$h1*2;
$b=14;
$s=2.5;
$i=36;
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

module vorderseite()
{
    translate([0,$d+$t,0])
    rotate([90,0,0])
    linear_extrude(height=$t)
    square([$b,$h1]);
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

bodenplatte();
vorderseite();
rueckseite_mit_loch();
