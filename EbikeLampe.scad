d=2;
w=4*0.9;

module leftholder()
{
linear_extrude(w*3, scale=1.3)
polygon([[0,0],[d,w],[d+w,w],[w,0]]);
}

module rightholder()
{
    mirror()
    leftholder();
}


//rightholder();
$fn=72;
k=18;

module test()
{
translate([14,26,0])
{
    difference()
    {
    cylinder(h=4, d=k);
    
    translate([-k/2,0,0])
    cube([k,k,4]);
    }
}
}

i=6.5;
difference()
{
cylinder(h=4, d=k);
cylinder(h=4, d=i);
}

rotate([-5,-7,0])
translate([-8.8,7.5,0.82])
rotate([0,0,35])
leftholder();

color("green", 0.5)
translate([0,0,4])
difference()
{
cylinder(h=6, r2=18, r1=16.5);
cylinder(h=6, d=i);
}

color("blue", 0.5)
translate([0,0,4])
difference()
{
cylinder(h=6, r=15.5);
cylinder(h=6, d=i);
}