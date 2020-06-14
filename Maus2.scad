$fn=360;
$tir=28;
$tiro=30;
$height = (35+16-4) /2; //51
$heighto = (35+16) /2;
$l = 39;
$lo = 39+2;

module holderbase()
{
difference()
{
sphere($height/2);

translate([-$height/2,0,-$height/2])
cube([$height,$height/2,$height]);

translate([-$height/2,-$height/2,0])
cube([$height,$height/2,$height/2]);
}
}


difference()
{
translate([0,2,0])
resize(newsize=[$tiro*2,$heighto*2,$lo])
holderbase();

resize(newsize=[$tir*2,$height*2,$l])
holderbase();
}

difference()
{

translate([-$tiro,0,0])
cube([$tiro*2,2,$height/1.8]);

translate([0,2,$height/3])
rotate([90,0,0])
cylinder(2,1);
    
}