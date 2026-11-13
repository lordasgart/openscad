//Untersetzer fuer die Lampe auf dem Klavier (Keil, vorne hoch, hinten 0)

//Durchmesser (passt in ein Quadrat mit dieser Kantenlaenge)
d=77;
//Hoehe vorne
hv=30-13.5;
//Hoehe hinten
hh=1;

/* [Stopper fuer die Kerbe im Klavier] */

//Abstand Stopper von der Vorderkante
as=45.5-(7.5+(110-77)/2);
//Laenge Stopper (nach hinten)
ls=2;
//Tiefe Stopper (nach unten)
ts=2;
//Breite Stopper (mittig links/rechts)
bst=20;

$fn=128;

//Stopper unter dem Boden, greift in die Kerbe
translate([-bst/2,-d/2+as,-ts])
    cube([bst,ls,ts]);

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
