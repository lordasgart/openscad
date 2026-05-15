include <BOSL2/std.scad>

//Breite
b=169.5; //169-170
//Höhe
h=76; //77.5 mit Kamera, 25 bis USB, 20 bis Kamera
h3=20;
//Dicke
d=11.5; //12 mit Kamera
//Thickness
t=3.4;
//Front Innen
i=8;

//Huelle Breite
hb=t+b+t;

module handy()
{
    cube([b,d,h]);
}

module huelle()
{
    //cube([t+b+t,t+d+t,h3]);
    cuboid([hb,t+d+t,h3+t/2], anchor=FRONT+LEFT+BOT, chamfer=t); //t/2 = top-chamfer
}

module halter()
{
    difference()
    {
        huelle();

        translate([t,t,t]) handy(); //mitte
        translate([t+i,0,t]) cube([b-i-i,d,h]); //front

        translate([0,0,h3]) //t/2 = top-chamfer => see huelle
        cube([t+b+t,t+d+t,h3]);

        schrauben();
    }
}

module front()
{
    cube([t,t,h3]);
}

$fn=36;

module schraube1()
{
    cylinder(h=2, d1=5.5, d2=3);
    translate([0,0,2])
    cylinder(h=10.5, d1=3, d2=1.5);
}

module schraube()
{
    color("red")
    rotate([270,0,0])
    schraube1();
}

halter();

module schraubemitte()
{
    translate([hb/2,d+t-0.01,t+((h3/2-t/2))])
    schraube();
}

module schrauben()
{
    schraubemitte();

    translate([-30,0,0])
    schraubemitte();

    translate([30,0,0])
    schraubemitte();

    translate([-60,0,0])
    schraubemitte();

    translate([60,0,0])
    schraubemitte();
}
