$fn=36;
//Thickness
t=3.7;
//Schraubenkopfdicke
skd=4.8;
//Thickness 1 (Achtung: mindestens t + Schrauenkopfdicke)
t1=t+skd;
//Thickness 2
t2=t;
//Dicke Holm
dh=30;
//Delta Spiegel
ds=8;
//Height
h=dh;
//Thickness Mirror
tm=8.2;
//Durchmesser Schraubenkopf
dsk=12;
//Durchmesser Schraube
dsc=4;

module schraube() {
    color("#336666")
    translate([-t,dh/2,h/2]) 
    rotate([0,90,0])
    cylinder(h=t1+t2+tm, d=dsc);
}

module schraubenkopf() {
    color("#555555")
    translate([t,dh/2,h/2]) 
    rotate([0,90,0])
    cylinder(h=t1+t2+tm, d=dsk);
}

module platte1()
{
    cube([t1,dh+ds,h]);
}

module platte1_alt()
{    
    cube([t1,dh,h]);
    color("blue")
    translate([0,dh,0]) 
    cube([t1,ds,h]);
}

color("red")
translate([0,dh+ds,0])
cube([t1+t2+tm,t,h]);

color("green")
translate([t1+tm,dh,0])
cube([t2,ds,h]);

difference()
{
    platte1_alt();    

    schraubenkopf();
    schraube();
}
