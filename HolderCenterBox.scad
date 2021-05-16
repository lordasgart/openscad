include<MiniSpax.scad>

$fn=36;

//Durchmesser Schraube
ds=6.35; //= 1/4 Zoll
//Länge Schraubenhals
lsh=11.2;
//Höhe/Länge Schraubenkopf Total (falls wir Abstand brauchen)
hs=4.6;
//Durchmesser Beilagscheibe integriert
db=13;
//Höhe Beilagscheibe
hb=1.25;
//Durchmesser Mutternkopf
dm=10.85;
//Länge Schraube toal
lst=16.4;
//Höhe Mutternkopf
hm=lst-hb-lsh;

//Breite Connector
bc=50;
//Tiefe Connector
tc=4.0;

module schraube()
{
    cylinder(h=hm, d=dm);

    translate([0,0,hm])
    cylinder(h=hb, d=db);

    translate([0,0,hm+hb])
    cylinder(h=lsh, d=ds);
}

module connector_holzplatte()
{
    cube([bc,bc,tc], center=true);
}

module connector_down()
{
    xy=12;
    translate([0,0,-61/2-tc/2])
    cube([xy,xy,61], center=true);
}

module connector_speaker()
{
    rotate([15,0,0])
    translate([0,0,-61-30/2-tc/2])
    cube([30,5,30], center=true);
}
hull()
{
connector_holzplatte();


connector_down();
translate([0,-22,0])
connector_speaker();
}

ar=7;

translate([-bc/2+ar,-bc/2+ar,-tc/2])
spax();

translate([0,-bc/2+ar,-tc/2])
spax();

translate([bc/2-ar,-bc/2+ar,-tc/2])
spax();

translate([bc/2-ar,bc/2-ar,-tc/2])
spax();

translate([0,bc/2-ar,-tc/2])
spax();

translate([-bc/2+ar,bc/2-ar,-tc/2])
spax();

color("gray")
schraube();

//TODO: DIe Abstände nach unten noch ausrechnen und vom connector speaker den Durchmesser noch korrekt eintragen
