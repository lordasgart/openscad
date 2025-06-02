//LampeVerstaerker

$fn=36;

l1=5;
d12=9.5;

l2=17;
d23=11.5;

l3A=1.5;
d3A=17.5;
d3=10;
l3=10;
d3C=16;

l4=56;

d45=8;
d5=5.5;

t=3;

module lampenstueck() {
cylinder(h=l1,d=d12);
translate([0,0,l1])
cylinder(h=l2,d1=d12,d2=d23);
translate([0,0,l1+l2])
cylinder(h=l3A,d=d3A);
translate([0,0,l1+l2])
cylinder(h=l3,d=d3);
translate([0,0,l1+l2])
cylinder(h=l3,d=d3C);
translate([0,0,l1+l2+l3])
cylinder(h=l4,d1=d45,d2=d5);
}

lt=l1+l2+l3+l4;
dh=d3A+t+2;

module huelle1() {
translate([-dh/2,0,0])
cube([dh,dh/2,lt]);
}

difference() {
    huelle1();
    lampenstueck();
}