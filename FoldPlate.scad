t=3.4;
w=66;
h=155;

dc=53; //Depth Camera
wc=17.4; //Width Camera
ct=7.5; //Camera Top?
cl=7.4; //Camera Left?

tc=1; //Toleranz Camera

mp=3; //Minmize plate

module camera()
{
    color("red")
cube([wc+tc+tc, dc+tc+tc, t]);
}

difference()
{
    translate([mp,mp,0])
cube([w-mp-mp,h-mp-mp,t]);

translate([w-wc-cl-tc,h-dc-ct-tc,0])
camera();
    
    translate([cl-tc,h-dc-ct-tc,0])
camera();
    
    translate([cl-tc,ct-tc,0])
camera();
    
    
translate([w-wc-cl-tc,ct-tc,0])
camera();
}
