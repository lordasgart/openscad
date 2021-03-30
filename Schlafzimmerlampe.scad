$fn=36;

t = 1.0;
l = 78; //länge box
b = 28; //breite box
h = 28; //höhe box
lk = 4; //länge kabel mock
k1d = 8; //kabel1 dicke
k2d = 6; //kabel2 dicke
ab = 0.4; //abstand box
lt = 0.4; //layer thickness

module innen()
{
color("#999999") //innen
cube([l,b,h]); //innen
}

module kabel(kd)
{
color("#666666")
rotate([0,90,0])
cylinder(h=4,d1=kd,d2=kd);
}

module beidekabel()
{
translate([-(lk/2+t),b/2,h/2])
kabel(k1d);

translate([l+t-lk/2,b/2,h/2])
kabel(k2d);
}

module box()
{
//l
translate([-t,-t,-t])
cube([t,b+t*2,h+t*2]);

//r
translate([l,-t,-t])
cube([t,b+t*2,h+t*2]);

//u
translate([0,-t,-t])
cube([l,b+t*2,t]);

//o
translate([0,-t,h])
cube([l,b+t*2,t]);

//v
translate([0,-t,0])
cube([l,t,h]);

//h
translate([0,b,0])
cube([l,t,h]);
}

module boxmitloecher()
{
difference()
{
    box();
    beidekabel();
}
}

module cutbox()
{
color("red")
translate([-t,-t,-t+((h+t*2)/2)])
cube([l+t*2,b+t*2,h+t*2]);
}

module halfbox()
{
difference()
{
    boxmitloecher();
    cutbox();
}
}

halfbox();

translate([0,b+t*2+ab,0])
halfbox();

translate([-t,b,h/2])
cube([l+2*t,2*t+ab,lt]);
