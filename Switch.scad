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

//Abstand Bildschirm
ab=5;

//Abstand zu Lautsprecher L+R
al=ab*2;

//Thickness
t=0.9*4;

module switchlcd() {
    translate([(swoledb-swlcdb)/2+t,0,t])
    cube([swlcdb, swlcdt, swlcdh]);
}

//switchlcd();

module switcholed() {
    translate([t,0,t])
    cube([swoledb, swoledt, swoledh]);
}

//switcholed();

module side() {
    translate([0,0,t])
    cube([t,swoledt, swoledh]);
}

module bottom() {
    difference() {
        cube([t+swoledb+t, swoledt, t]);
        
        translate([t+al,0,0])
        cube([swoledb-al-al, swoledt, t]);
    }
}

module back() {
    translate([0,swoledt,0])
    cube([t+swoledb+t,t,swoledh+t]);
}

module front() {
    translate([0,-t,0])
    cube([ab+t,t,swoledh+t]);
}

module switch_wall_mount() {
    side();
    
    translate([swoledb+t,0,0])
    side();
    
    bottom();
    
    back();
    
    front();
    
    translate([swoledb-ab+t,0,0])
    front();
}

color("gray")
switch_wall_mount();
