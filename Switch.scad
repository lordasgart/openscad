//Switch LCD

//Breite Switch LCD
swlcdb=172;
//Hoehe Switch LCD
swlcdh=101;
//Tiefe Switch LCD
swlcdt=15;

//Switch LCD

//Breite Switch OLED
swoledb=175;
//Hoehe Switch OLED
swoledh=101;
//Tiefe Switch OLED
swoledt=15;

//Abstand zu Lautsprecher L+R
al=5;

//Thickness
t=3;

module switchlcd() {
    translate([(swoledb-swlcdb)/2+t,0,0])
    cube([swlcdb, swlcdt, swlcdh]);
}

switchlcd();

module switcholed() {
    translate([t,0,0])
    cube([swoledb, swoledt, swoledh]);
}

switcholed();