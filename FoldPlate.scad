t=4;
w=66;
h=155;

dc=50; //Depth Camera?
wc=12; //Width Camera?
ct=7; //Camera Top?
cl=5; //Camera Left?

difference()
{
cube([w,h,t]);

translate([w-wc-cl,h-dc-ct,0])
color("red")
cube([wc, dc, t]);
}
