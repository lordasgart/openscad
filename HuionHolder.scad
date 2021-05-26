//Huion Holder

//Minimale Breite
m=9*1.03;
//Width
w=70;
//Thickness
t=3.79; //9 Lines PrusaSlicer
//Height
h=40;
//Breite
b=50;

module walls()
{
    translate([-t-m/2,0,0])
    {
        cube([t,w,h]);

        translate([m+t,0,0])
        cube([t,w,h]);
    }
}

walls();

translate([-b/2,0,0])
cube([b,w,t]);
