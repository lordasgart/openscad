//Höhe
h=60;
//Toleranz
to=1;
//Dicke
t=1.4;
//Durchmesser Kabel
dk=6.5;
//Größe Box
gb=h/1.8;

$fn=36;

module klotzmitloch()
{
difference()
{
cube([gb,gb,h]);

//translate([t,t,t])
//cube([gb-t-t,gb-t-t,h-t-t])

translate([gb/2, gb/2, -to-t])
color("red")
cylinder(h = h+to+to+t+t, d = dk);
}
}

module halberklotzmitloch()
{
difference()
{
    klotzmitloch();
    
    translate([0,gb/2,0])
    cube([gb,gb,h]);
}
}

difference()
{
halberklotzmitloch();

translate([t,t,t])
cube([gb-t-t,gb-t-t,h-t-t]);
}
