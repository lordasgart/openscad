$b=5.6;
$s=3;
$i=36;
$t=2;

//import("C:\\Users\\lordasgart\\Nextcloud\\Documents\\3D\\STL\\z906_halterung_v1.stl");

module z906()
{
import("C:\\Users\\lordasgart\\Nextcloud\\Documents\\3D\\STL\\Z906RemoteA.stl");
}

module schraube()
{
translate([0,11,-25])
color("gray")
rotate([90,0,0])
//linear_extrude(height=$t)
//circle(d=$s,$fn=$i);
cylinder(d1=$s,d2=$b,h=$t,$fn=$i);
}

difference()
{
 z906();
 schraube();   
}