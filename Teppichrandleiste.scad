//Teppichrandleiste
//Abschlussschiene am Uebergang Teppich -> anderer Boden (Laminat, Fliesen, Parkett ...)
//
//Querschnitt (Blick auf die Stirnseite, x quer zur Schiene, z nach oben):
//
//   Teppichseite                          Bodenseite
//              ______________________
//   _________/|                      |\___________
//  |__Lippe__ |        Steg          |  Rampe     \
//   ^^^^^^^^^ |  (steht im Spalt)    |_____________|
//   Teppich   |                      |  anderer Boden
//  ===========|______________________|=============  z=0 (Estrich)
//            x=0                   x=spalt
//
//Die Lippe klemmt die Teppichkante, die Rampe liegt flach auf dem anderen Boden auf.
//Befestigung mit Senkkopfschrauben durch den Steg in den Estrich.

/* [Allgemein] */

//Laenge der Schiene (an das Druckbett anpassen)
laenge=150;

//Ansicht: false = Einbaulage, true = auf die Stirnseite gedreht zum Drucken
druck=false;

/* [Boeden] */

//Hoehe Teppich ueber Estrich
h_teppich=10;
//Um so viel wird der Teppich unter der Lippe zusammengedrueckt
klemmung=2;
//Hoehe anderer Boden ueber Estrich (Laminat + Trittschalldaemmung)
h_boden=8;
//Breite des Spalts zwischen Teppichkante und anderem Boden
spalt=10;

/* [Profil] */

//Wie weit die Lippe ueber den Teppich greift
ue_teppich=12;
//Wie weit die Rampe ueber den anderen Boden greift
ue_boden=10;
//Materialstaerke oben ueber dem hoeheren der beiden Boeden
d_oben=3;
//Dicke der Kanten an Lippen- und Rampenende (fuer den Drucker nicht zu duenn)
kante=0.8;
//Rundung der Innenecke Lippe/Steg (macht die Lippe stabiler, 0 = aus)
r_innen=1;

/* [Krallen unter der Lippe] */

//Krallen, die sich in den Teppichflor druecken
krallen=true;
//Hoehe der Krallen
h_kralle=1;
//Anzahl Krallen
n_krallen=3;

/* [Schrauben] */

//Schraubenloecher
schrauben=true;
//Durchmesser Schraubenschaft (mit etwas Spiel)
d_schraube=3.6;
//Durchmesser Senkkopf
d_kopf=7.2;
//Abstand der Schrauben vom Schienenende
rand_schraube=20;
//Maximaler Abstand zwischen zwei Schrauben
max_abstand_schraube=300;

$fn=48;

//Unterkante der Lippe = Oberkante des zusammengedrueckten Teppichs
z_lippe=h_teppich-klemmung;
//Hoehe des Plateaus ueber dem Spalt
z_top=max(z_lippe,h_boden)+d_oben;

assert(spalt>=d_kopf+1.2, "Spalt zu schmal fuer den Schraubenkopf");
assert(z_lippe>0, "Klemmung groesser als Teppichhoehe");
assert(h_boden<z_top-kante, "Rampe zu flach");

module profil_grund()
{
    polygon([
        //Lippe, Spitze
        [-ue_teppich, z_lippe],
        [-ue_teppich, z_lippe+kante],
        //Plateau ueber dem Spalt
        [0, z_top],
        [spalt, z_top],
        //Rampe, Spitze
        [spalt+ue_boden, h_boden+kante],
        [spalt+ue_boden, h_boden],
        //Unterseite Rampe, Steg im Spalt
        [spalt, h_boden],
        [spalt, 0],
        [0, 0],
        [0, z_lippe],
    ]);
}

module profil()
{
    //Innenecken ausrunden, Aussenmasse bleiben gleich
    if (r_innen>0)
        offset(r=-r_innen) offset(delta=r_innen) profil_grund();
    else
        profil_grund();

    //Saegezahn-Krallen unter der Lippe, Spitze zeigt Richtung Steg,
    //damit der Teppich beim Zurueckziehen festgehalten wird
    if (krallen && n_krallen>0)
    {
        bk=(ue_teppich-r_innen)/n_krallen;
        for (i=[0:n_krallen-1])
        {
            x0=-ue_teppich+i*bk;
            polygon([
                [x0, z_lippe],
                [x0+bk, z_lippe],
                [x0+bk, z_lippe-h_kralle],
            ]);
        }
    }
}

module schraubenloch()
{
    //Schaft
    translate([0,0,-1]) cylinder(h=z_top+2, d=d_schraube);
    //Senkkopf (90 Grad)
    translate([0,0,z_top-(d_kopf-d_schraube)/2])
        cylinder(h=(d_kopf-d_schraube)/2+0.01, d1=d_schraube, d2=d_kopf);
    translate([0,0,z_top]) cylinder(h=1, d=d_kopf);
}

module schiene()
{
    difference()
    {
        //Profil entlang y extrudieren
        rotate([90,0,0]) translate([0,0,-laenge]) linear_extrude(height=laenge) profil();

        if (schrauben)
        {
            n=max(2, ceil((laenge-2*rand_schraube)/max_abstand_schraube)+1);
            abst=(laenge-2*rand_schraube)/(n-1);
            for (i=[0:n-1])
                translate([spalt/2, rand_schraube+i*abst, 0]) schraubenloch();
        }
    }
}

if (druck)
    //Auf die Stirnseite stellen: Profil liegt auf dem Druckbett, keine Ueberhaenge
    rotate([-90,0,0]) translate([0,-laenge,0]) schiene();
else
    schiene();
