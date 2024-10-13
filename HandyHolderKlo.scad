// Handyholder Klo
$fn=36;

tabletwidthfold4 = 150;

width = (3/5)*tabletwidthfold4;

height = 70;

depth = 40;

front = 10;

t = 2.08;

module halter()
{
    
    color("#FF00FF")
    cube([width,depth,t]);

    translate([0,-t,0])
    cube([width,t,height]);

    //Front
    color("yellow")
    translate([0,depth,0])    
    cube([width,t,front+t]);
        
    translate([0,depth+0.31,front+1.25])    
    rotate([45,0,0])
    {
        color("red")
        cube([width,t,t*2]);
        
        translate([0,t/2,0])
        rotate([0,90,0])
        color("green")
        cylinder(h=width,d=t);
        
        translate([0,t/2,t*2])
        rotate([0,90,0])
        color("blue")
        cylinder(h=width,d=t);
    }    
}

module hole() {
    translate([0,-t,0])
    rotate([270,0,0])
    cylinder(h=t, d1=2, d2=5);
}

module withholes() {
    difference() {
        a();
        
        translate([width/2+20,0,height/2+10])
        hole();
        
        translate([width/2-20,0,height/2+10])
        hole();
        }
}

//halter();

color("orange")
translate([0,depth+t+t,-t])
cube([width,t,front]);

color("#660066")
translate([0,+t+t+t,-t-t])
cube([width,depth,t]);