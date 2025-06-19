//Solarpanel
$fn=180;
//Breite
b=1765;
//Höhe
h=1038;
//Tiefe
d=35.25;
//Breite Panelrand
br=11.5;
//Höhe Panelrand
hr=8.2;
//Tiefe Panelrand
tr=2.55;
//Breite Rand zu Solarzellen (max!)
bs=4.0;
//Kabel Durchmesser
kd=6.5;

//Tiefe Rand hinten
trh=35.0;
//Tiefe hinten
th=27.5;

//Breitenanpassung
ba=0;

//Breite Basishalter aus Kuben
brh=trh+ba;
//brh=10;

//Dicke Basishalter aus Kuben
dbh=kd;

bi=b-br*2; //Breite Innenbereich komplett
hi=h-hr*2; //Hoehe Innenbereich komplett

bz=bi-bs*2; //Breite nur Solarzellenbereich
hz=hi-bs*2; //Hoehe nur Solarzellenbereich

bb=b-trh*2; //Breite hinten innen
db=th; //Tiefe hinten innen
hb=h-trh*2; //Hoehe hinten innen

//Hinterer Kreis
hk=kd*10;

module panel_full() {
    color("#666666")
    cube([b,d,h]);
}

module panel_space_front() {
    color("#BBBBBB")
    translate([br,0,hr])
    cube([bi,tr,hi]);
}

module panel_space_solarcells() {
    translate([br+bs,0,hr+bs])
    cube([bz,tr,hz]);
}

module panel_back() {
    translate([trh,d-th,trh])
    cube([bb,db,hb]);
}

module solarpanel() {
    difference() {
        panel_full();
        panel_space_front();
        panel_space_solarcells();
        panel_back();
    }
}

module test_hinten() {
    rotate([0,270,0]) {
        
        //Kabel
        translate([0,0,-b])
        color("red")
        linear_extrude(b)
        translate([trh+kd/2,kd/2+d,0])        
        circle(d = kd);
        
//        difference() {
//            translate([hk/4,hk/2+d,0])
//            circle(d = hk);
//            
//            color("blue")
//            translate([hk/4,hk/2+d+hk/6,0])
//            square(hk, true);
//        }
        //circle(d = hk*2);
    }
}

module cube_hinten() {
    translate([0,d,0]) //Versetzt um Dicke des Panel nach hinten
    cube([brh,dbh,trh]); //BreiteHalter,DickeBasisHalter,TiefeRandHinten
    translate([brh,d+dbh/2,trh])
    rotate([0,270,0])    
    cylinder(h=brh, d=dbh);
}

module cube_unten() {
    translate([0,0,-dbh]) //Versetzt um Dicke Basishalter
    cube([brh,d+dbh,dbh]); //BreiteHalter,Dicke des Panel+DickeBasisHalter,DickeBasishalter
}

module cube_vorne() {
    translate([0,-dbh,-dbh])
    cube([brh,dbh,dbh+hr+bs/2]); //Höhe ist DickeBasishalter+Höhe des Panelrand(hr)+Breite Rand zu Solarzellen (max!)(bs)/2
    
    //=> Damit das gescheit auch hier reingeht, eine Halbe Kugel oben drauf mit bs/2 statt Kubus um bs/2 zu erhöhen. Kubus bleibt, aber weil mir sonst die Schneiderei mit dem quarter_cylinder zu komplex wird und wird kommen dann auf ein bisschen höher, aber die Sonne kommt ja von oben
    translate([brh,-dbh/2,hr+bs/2])
    rotate([0,270,0])    
    cylinder(h=brh, d=dbh);
}

//Breite Quarter Cylinder
bqc= dbh+d+dbh;

//Viertel Zylinder unten als halter mit radius so groß wie die zusammengesetzten Kuben jetzt tief sind insgesamt: //Schraube(n) mit vertikaler Nut (mit Beilagscheibendurchmesser!) nur hier, damit wir das nachfixieren können, wenn wir die Höhe noch anpassen wollen, wenn das Panel dann drauf ist.
module quarter_cylinder() {
    
    difference() {
        translate([brh,trh/2,-dbh])
        rotate([0,270,0])    
        cylinder(h=brh, d=bqc);
        
        panel_full();
    }
    translate([0,-dbh+bqc/2,-bqc/2-dbh])
    cube([brh,bqc/2,bqc/2]);
}

//Gleitabschnitt hinten oben noch

//Prototyp mit brh = 1 oder so drucken



//test_hinten();

//solarpanel();

cube_hinten();
cube_unten();
cube_vorne();
quarter_cylinder();

//Dicke Ratschennuss
drn=20;
//Dicke Schraube
ds=5;

xxx=0;
yyy=6;

module spalt_schraubendicke(spalt_dicke) {
    color("red")
    translate([brh/2,-25,-dbh-bqc/4+xxx-yyy])
    rotate([270,0,0])
    cylinder(h=100, d=spalt_dicke);

    color("red")
    translate([brh/2,-25,-dbh-bqc/4+spalt_dicke-xxx-yyy])
    rotate([270,0,0])
    cylinder(h=100, d=spalt_dicke);

    color("green")
    translate([brh/2-spalt_dicke/2,-25,-dbh-bqc/4+xxx-yyy])
    cube([spalt_dicke,100,spalt_dicke-xxx*2]);
}

spalt_schraubendicke(ds);
//spalt_schraubendicke(drn);

//Jetzt zu felxiblen Modul und mit zwei Parameter Tiefe und
//Durchmesser in der Dicker der Nuss

//TODO: Zentrum ist die Box vom Spalt (doch mal BOSL2 probieren?)
