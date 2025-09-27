//hoch
h=35;
//breit
b=54;

p1=20;
p2=19;

p3=17;
p4=16;

p5=14;
p6=13;

$fn=90;

// Viereck aus vier Punkten (2D)
points = [
    [0, 0],    // Punkt 0
    [h, 0],   // Punkt 1
    [h, p4],  // Punkt 2
    [0, p3]  // Punkt 3
];

// "paths" macht die Verbindung explizit: 0->1->2->3->0
module adapter()
{
    color("silver")
translate([b,0,h])
rotate([0,90,180])
linear_extrude(b)
polygon(points = points, paths = [[0,1,2,3]]);
}

module loch()
{
color("red")
rotate([90,0,0])
cylinder(p1, d/2, d/2);
}


//loch-loch außen zu außen
ll=47.5;
//ll2
ll2=23.6;
//durchmesser loch
d=5.5;

module loecher()
{
loch();
translate([ll-d,0,0])
loch();
translate([ll-d,0,ll2-d])
loch();
translate([0,0,ll2-d])
loch();
}

difference() {
    adapter();

translate([(b-(ll-d))/2,0,(h-(ll2-d))/2])
loecher();
}