$fn=36;

//thickness
t=1.8;
//inner height
ih=13;
//inner width
iw=9;
//outer border on each side
ob=3;

module plate()
{
cube([ih,iw,t],true);

translate([0,0,t])
cube([ih+ob*2,iw+ob*2,t], true);
}

difference()
{
  translate([0,0,t/2])
  plate();
  cylinder(h=t*2, d1=5, d2=5);
}
