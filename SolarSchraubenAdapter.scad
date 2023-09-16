h=14.8;
w=h;
t=1.5;

bs=8.5;
hs=10;

difference()
{
cube([w,t,h]);

translate([(w-bs)/2,0,(h-hs)/2])
color("blue")
cube([bs,t,hs]);
}
