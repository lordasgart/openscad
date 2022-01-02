$fn=360;

module blende()
{
color("gray")
linear_extrude(0.5)
circle(d=180);
}

module aussparung()
{
translate([10,0,0.25])
cube([20,120,0.5],true);
}

difference()
{
    blende();
    //aussparung(); aussparung3();
    aussparung2();
}

module aussparung2()
{
translate([45,0,0.25])
cube([90,180,0.5],true);
}

module aussparung3()
{
translate([-45,0,0.25])
cube([90,180,0.5],true);
}