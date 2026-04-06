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

//leftholder();
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