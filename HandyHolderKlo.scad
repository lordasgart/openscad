// Handyholder Klo
$fn=36;

tabletwidthfold4 = 150;

width = (3/5)*tabletwidthfold4;

height = 70;

depth = 15;

t = 3;

module a()
{
cube([width,depth,3]);

translate([0,-t,0])
cube([width,t,height]);

translate([0,depth,0])
cube([width,t,10+t]);
}

module hole() {
    translate([0,-t,0])
rotate([270,0,0])
cylinder(h=t, d1=2, d2=5);
}

module withholes() {
difference()
{
    a();
    
    translate([width/2+20,0,height/2+10])
    hole();
    
    translate([width/2-20,0,height/2+10])
    hole();

}
}

a();