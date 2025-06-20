//Gartenlicht

aussen=75;
innen=72;
hoehe=142;

oben=68;
unten=61;
laenge_zylinder=25;
laenge_kerze=140;

mt=(aussen-innen)/2;

t=5;

module Metal() {
    difference() {
        cube([aussen, aussen, hoehe]);
        translate([mt,mt,0])
        cube([innen, innen, hoehe]);
    }
}

//Metal();

module Kerze() {
    translate([(aussen+t/2)/2,(aussen+t/2)/2,hoehe])
    cylinder(h=laenge_kerze-laenge_zylinder, d=oben);
    
    color("green")
    translate([(aussen+t/2)/2,(aussen+t/2)/2,hoehe-laenge_zylinder])
    cylinder(h=laenge_zylinder, d2=oben, d1=unten);
}

//Kerze();

module deckel() {        
    translate([mt,mt,hoehe-laenge_zylinder-t])
    cube([aussen, aussen, laenge_zylinder+t*2]);
}

difference() {
    deckel();
    Kerze();
}
    
