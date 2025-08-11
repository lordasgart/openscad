//Hoehe Handy
h=171;
//Breite Handy
b=77;
//Tiefe Handy
th=13;

//Thickness
t=3;

difference() {
    cube([h+t+t, th+t, b+t]);
    translate([t,0,t])
    color("gray")
    cube([h, th, b]);
}
