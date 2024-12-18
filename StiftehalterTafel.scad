d1=15.3;
d2=12.3;

h1=10;

t=2.0;

module clip(ds)
{
    difference()
    {
        dst=ds+t+t;
        cylinder(h=h1, d=dst);
        cylinder(h=h1, d=ds);
        translate([t*2,-dst/2,0])
        cube([dst,dst,h1]);
    }
}

translate([-9.8,-15.8,0])
cube([t, 50, h1]);
clip(d1);
translate([-1,d1+t+t,0])
clip(d2);