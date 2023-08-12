//Breite Box
bb=200;
//Tiefe Box
tb=20;
//Hoehe box
hb=20;
//Thickness
t=2;

tr=t/2/2;

//difference()
//{
//cube([bb, tb, hb]);
//
//translate([t,t,t])
//cube([bb-t*2, tb-t*2, hb]);
//}
//Breite Holder
bh=hb/2;
//Tiefe Holder
th=tb*2;
//Hoehe Holder
hh=hb;

//translate([0,tb,0])
//color("blue")
// cube([bh,th,hh]);
//
//translate([bb-bh,tb,0])
//cube([bh,th,hh]);

translate([-t-tr,0,-t-tr])
cube([t+bh+t+tr+tr,th,t]);

translate([bh+tr,0,hh-t+tr])
cube([bh,th,t]);

translate([bh+tr,0,-tr])
cube([t,th,hh+tr*2]);

translate([-t-tr,0,-tr])
cube([t,th,hh+tr*2]);

translate([-bh-tr,0,hh-t+tr])
cube([bh,th,t]);