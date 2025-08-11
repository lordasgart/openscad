//Hoehe Handy
h=171;
//Breite Handy
b=77;
//Tiefe Handy
th=13;

//Thickness
t=3;

difference() {
    cube([h+t+t, th+t+t, b+t]);
    translate([t,0,t])
    color("gray")
    cube([h, th, b]);
}

ha=3;
hah=18;
haa=10;
translate([0,-t,b+t-hah-haa])
color("red")
cube([ha+t,t,hah]);