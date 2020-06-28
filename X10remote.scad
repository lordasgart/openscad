//x10
$fn=36;
h=40;//80 height until end of battery holder, but we only use the half
th=h+106;//total height of remote
w=48;//47 breit, mit Toleranz
d=20;//depth without keys 19, with keys 22 => 20 mit Toleranz
lb=4;//left border until keys
bb=20;//bottom border until keys
t=2.4;

//bottom plate
cube([2*t+w,2*t+d,t]);

//Left side
translate([0,0,t])
cube([t,2*t+d,h]);

//Right side
translate([t+w,0,t])
cube([t,2*t+d,h]);


//Front left
translate([t, 0, t])
cube([lb,t,h]);

//Front right
translate([w-lb+t, 0, t])
cube([lb,t,h]);

//Front bottom
cube([w,t,bb]);

module screwhole($t,$dg,$dk)
{
    color("gold")
    rotate([90,0,0])
    cylinder(h=$t,d1=$dk,d2=$dg);
}

difference()
{
//Back
translate([t, d+t, t])
cube([w,t,h]);

translate([(w+t+t)/2,t+d+t,bb+(h-bb)/2])
screwhole(t,7,3);
}

