$fn=18;

//Dicke
d=10.5;
//Top width
tw=36;
//Bottom width
bw=44;
//Durchmesser Stopfen
ds=4.8;
//Height
h=40;
//Thickness
t=2.96;
//Breite Brett
bb=35;
//Tiefe Stopfen (Zentrum)
ts=19.8;
 
module webcam() {
    translate([t,t,t])
    color("#777777")
    cube([bw, d, h]);
}
 
webcam();
 
//Halter linke Wand
btwd=bw-tw;
fw=btwd+t*2; //Front wall
cube([fw, t , h]);
//Halter rechte Wand
translate([bw-fw+t*2,0,0])
cube([fw, t , h]);

bv=(bw-bb)/2; //Brett Versatz

//Brett
module brett() {
    translate([t+bv,d+t+t,0])
    color("#AA6600")
    cube([bb, ts*4, h]);
}
 
brett();

//Halter unter
translate([0,0,0])
cube([bw+t*2, d+t , t]);

//Wand hinten
translate([0,d+t,0])
cube([bw+t*2,t,h]);

//Wand links hinten
difference() {
    translate([bv,t+d+t,0])
cube([t,ts+ds*2,h]);
loch();
}

//Wand rechts hinten

difference() {
translate([bv+bb+t,t+d+t,0])
cube([t,ts+ds*2,h]);
loch();
}

//Wand links aussen

cube([t,d+t,h]);

//Wand rechts aussen
translate([bw+t,0,0])
cube([t,d+t,h]);

module loch()
{
//Loch
ll=bw+t+t;
translate([ll/2,t+d+t+ts,h/2])
rotate([0,90,0])
color("blue")
cylinder(ll, d=ds, center = true);
}

