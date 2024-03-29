$fn = 72;

h = 32;
d = 48;

t = 3.5;
ts = 2.5;
ds = 6.5;

d2 = d + t * 2;
dt = h / 2 + t * 2;
d3 = d2 + dt;
d4 = d3 / 2 - dt / 4;

module foot()
{
    color("gray") cylinder(h = h, d = d);
}

module holderfull()
{
    cylinder(h = h / 2, d = d2);
    cylinder(h = t, d = d3);
}

module holderempty()
{
    difference()
    {
        holderfull();
        foot();
    }
}

module cutterblock()
{
    // cut half
    translate([ -d3 / 2, 0, 0 ]) cube([ d3, d3 / 2, h ]);

    // cut quarter
    // translate([0, -d3/2,0])
    // cube([d3, d3/2, h]);
}

module holderhalf()
{
    difference()
    {
        holderempty();
        cutterblock();
    }
}

y = sin(45);
x = cos(45);

module screw()
{
    color("red") cylinder(h = t, d1 = ts, d2 = ds);
}

module screw1()
{
    translate([ -d4 * x, -d4 * y, 0 ]) screw();
}

module screw2()
{
    translate([ d4 * x, -d4 * y, 0 ]) screw();
}

module screws()
{
    screw1();
    screw2();
}

module holder()
{
    difference()
    {
        holderhalf();
        screws();
    }
}

holder();
