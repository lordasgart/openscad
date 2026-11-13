//Untersetzer fuer die Lampe auf dem Klavier (Keil, vorne hoch, hinten 0)

//Durchmesser (passt in ein Quadrat mit dieser Kantenlaenge)
d=77;
//Hoehe vorne
hv=30-13.5;
//Hoehe hinten
hh=1;

$fn=128;

//Steigung von hinten (y=+d/2) nach vorne (y=-d/2)
winkel=atan((hv-hh)/d);

mirror([0,1,0])
intersection() {
    cylinder(d=d,h=hv);
    //Schraege Ebene: alles unterhalb gehoert zum Untersetzer
    translate([0,-d/2,hh])
        rotate([winkel,0,0])
            translate([-d,0,-2*hv])
                cube([2*d,2*d,2*hv]);
}
