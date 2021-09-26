include<MiniSpax.scad>

$fn=90;

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

//Höhe Box vorne
hbv=115;
//Höhe Box hinten
hbh=77;
//Abstand Schraubenlochzentrum zu hinten Rand
aslz=28.3;
//Kabelabstand hintere obere Kante
kah=40;

//Connector down => h/2 ist mehr als genug, siehe Skizze in Microsoft Whiteboard
cd=hbv/2;
//Connectorbreite => 50 sollte trptz Krümmung ohne Probleme gehen
cb=50;
//Winkel
winkeldown=15;
winkellr=5;

//Abstand der Spax vom Rand
ar=7;

module schraube()
{
    cylinder(h=hm, d=dm);

    translate([0,0,hm])
    cylinder(h=hb, d=db); //Original        

    translate([0,0,hm+hb])
    cylinder(h=lsh, d=ds); //Original    
}

module schrauben_bohrung()
{
    cylinder(h=hm, d=dm);

    //translate([0,0,hm])
    //cylinder(h=hb, d=db); //Original    
    translate([0,0,-40+hm+hb]) //Bohrungsröhre
    cylinder(h=40, d=db*1.05);

    translate([0,0,hm+hb])
    //cylinder(h=lsh, d=ds); //Original
    cylinder(h=lsh, d=ds*1.05); //Bohrungsröhre
}

module connector_holzplatte()
{
    cube([bc,bc,tc], center=true);
}

module connector_down()
{
    xy=16;
    translate([0,0,-cd/2-tc/2])
    cube([xy,xy,cd], center=true);
}

module connector_speaker()
{
    rotate([winkeldown,0,winkellr])
    translate([0,bc/2-tc/2,-cd-tc/2])
    cube([cb/2,tc,20], center=true);
}

module schraubenbohrung_unten()
{    
    translate([0.5,-0.5,-54.5]) //Passt fast perfekt mit y=0
    color("gray")
    rotate([90+winkeldown,0,winkellr])
    schrauben_bohrung();
}

module allespax()
{
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
}

//color("gray")
//schraube();

module lrspeaker()
{
difference()
{
    connector_holzplatte();
    allespax();
}

difference()
{
    hull()
    {
        connector_down();
        
        translate([4,-45,-5])
        connector_speaker();
    }
    //schraubenbohrung_unten();
}
}

mirror([1,0,0])
lrspeaker();
