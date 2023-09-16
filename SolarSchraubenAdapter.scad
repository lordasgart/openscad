h=14.8;
w=h;
t=1.5;
to=0.4;

bs=8.5;
hs=10;
a=bs/2;
hsa=h+a+a;

wd=(w-bs)/2;
hd=(h-hs)/2;

difference()
{
cube([w,t,h]);

translate([wd,0,hd])
color("blue")
cube([bs,t,hs]);
}

module addons()
{
translate([0,t,0])
color("green")
cube([wd-to,t*2,hsa]);

translate([w-wd+to,t,0])
color("green")
cube([wd-to,t*2,hsa]);
}

translate([0,0,-a])
addons();