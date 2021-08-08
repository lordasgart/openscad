
$fn=180;
w=40;
h=40;
wz=w*1.5;

t=2.54;
th=2.5;

ds=2.5; //durchmesser schraube
dso = 6.75; //durchmesser schraube oben (kopf)
hk=3.0; //(hoehe kopf)

module wand()
{
color("red")
cube([w,h/2,t]);

translate([w/2,w/2,0])
cylinder(h=t,d=w);
}

//cube([w,t,h]);

difference()
{
translate([h/2,-22.34+th,0])
cylinder(h=h,d=wz);

translate([wz-w-wz/2,-wz,0])
cube([wz,wz,h]);
    
    translate([-w,0,0])
cube([w,th,h]);

translate([w,0,0])
cube([w,th,h]);
    
    
}

module waende()
{
    
wand();

translate([0,0,h-t])
wand();
}

module waende_mit_loechern()
{difference()
    {
    waende();
        
        holes();
    }
}

waende_mit_loechern();

module holes()
{
translate([w/2,h/2,0])
color("blue")
cylinder(h=h,d=ds);

translate([w/2,h/2,h-t])
color("green")
cylinder(h=t,d=dso);

translate([w/2,h/2,-hk+t])
color("pink")
cylinder(h=hk,d1=ds, d2=dso);
}
