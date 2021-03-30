//90mm hoch //37mm durchmesser //32mm 18mm

cylinder(h=10,d1=37,d2=32,center=false, $fn=64);

color("red")
cylinder(h=90,d1=16,d2=16,center=false, $fn=64);

module holderstandconnector()
{
    translate([0,0,90])
    color("blue")
    cylinder(h=12.8,d1=16,d2=16,center=false, $fn=64);
}

module holder()
{
    translate([-20.8,0,108])
    rotate([0,50,0])
    difference()
    {
        cylinder(h=18.7,d1=40,d2=45,center=false, $fn=64);
        cylinder(h=18.7,d1=32,d2=37,center=false, $fn=64);
    }
}

holder();

hull()
{
  holderstandconnector();
  holder();
}
