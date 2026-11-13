//Untersetzer fuer die Lampe auf dem Klavier (Keil, vorne hoch, hinten 0)

//Durchmesser (passt in ein Quadrat mit dieser Kantenlaenge)
d=77;
//Hoehe vorne
hv=30-13.5;
//Hoehe hinten
hh=1;
//Radius Abrundung obere Kreiskante
r=2;

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
//Ebene um so viel anheben, dass die Rundung vorne wieder genau hv hoch ist
k=r*tan(winkel)+r/cos(winkel)-r;

//Keil mit Durchmesser dk, schraege Ebene um o nach unten versetzt
module keil(dk,o) {
    intersection() {
        translate([0,0,-o])
            cylinder(d=dk,h=hv+2*o);
        //Schraege Ebene: alles unterhalb gehoert zum Untersetzer
        translate([0,-d/2,hh+k])
            rotate([winkel,0,0])
                translate([-d,-d,-2*hv-o])
                    cube([2*d,3*d,2*hv]);
    }
}

//Innen um r verkleinert, per minkowski wieder auf d aufgefuellt.
//Unten flach abgeschnitten, damit nur die obere Kante rund ist und z=0 bleibt.
mirror([0,1,0])
intersection() {
    cylinder(d=d+1,h=2*hv);
    minkowski() {
        keil(d-2*r,r);
        sphere(r=r,$fn=32);
    }
}
