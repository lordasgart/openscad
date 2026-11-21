//Teppichrandleiste
//Abschlussschiene fuer einen Teppich, der auf einem anderen Boden (Laminat, Fliesen, Parkett ...) aufliegt.
//Ohne Schrauben: die Teppichkante wird in einen Schlitz gesteckt und von Widerhaken gehalten,
//auf der anderen Seite laeuft eine Rampe flach auf den Boden aus.
//
//Querschnitt (Blick auf die Stirnseite, x quer zur Schiene, z nach oben):
//
//      Teppichseite                    Bodenseite
//                   ______
//      ____Lippe___/      |\__
//     |  v v v v v        |   \___
//     |   Schlitz         |       \___  Rampe
//     |__^_^_^_^_^__      |           \___
//          Zunge     \____|_______________|
//  =================================================  z=0 (Boden)
//   x=-tiefe_schlitz     x=0  x=wand            x=wand+l_rampe

/* [Allgemein] */

//Laenge der Schiene (beim Drucken auf der Stirnseite = Druckhoehe)
laenge=150;

//Ansicht: false = Einbaulage, true = auf die Stirnseite gedreht zum Drucken
druck=false;

/* [Teppich] */

//Dicke des Teppichs
h_teppich=3;
//Um so viel wird der Teppich im Schlitz zusammengedrueckt
klemmung=0.5;
//Wie tief der Teppich in den Schlitz gesteckt wird
tiefe_schlitz=15;

/* [Profil] */

//Dicke der Zunge unter dem Teppich an der Rueckwand (laeuft zur Spitze hin duenn aus)
d_zunge=1.2;
//Materialstaerke der Lippe ueber dem Teppich an der Rueckwand
d_oben=2;
//Dicke der Rueckwand des Schlitzes
wand=3;
//Laenge der Rampe auf dem Boden (laenger = flacher, weniger Stolpergefahr)
l_rampe=20;
//Dicke der auslaufenden Kanten an Lippe, Zunge und Rampe (fuer den Drucker nicht zu duenn)
kante=0.6;
//Rundung der Innenecken im Schlitz (0 = aus)
r_innen=0.5;

/* [Widerhaken im Schlitz] */

//Widerhaken an der Unterseite der Lippe
haken_oben=true;
//Widerhaken auf der Oberseite der Zunge
haken_unten=true;
//Hoehe der Widerhaken
h_haken=0.6;
//Anzahl Widerhaken je Seite
n_haken=4;

$fn=48;

//Hoehe des Schlitzes an der Rueckwand
h_schlitz=h_teppich-klemmung;
//Unterkante der Lippe
z_lippe=d_zunge+h_schlitz;
//Hoechster Punkt der Schiene
z_top=z_lippe+d_oben;

assert(h_schlitz-(haken_oben?h_haken:0)-(haken_unten?h_haken:0)>1,
       "Schlitz zu eng fuer die Widerhaken");
assert(d_zunge>=kante, "Zunge duenner als die Mindestkante");

//Oberseite der Zunge an Stelle x (laeuft von kante an der Spitze auf d_zunge an der Rueckwand)
function z_zunge(x)=kante+(d_zunge-kante)*(x+tiefe_schlitz)/tiefe_schlitz;

module profil_grund()
{
    polygon([
        //Zunge, Spitze
        [-tiefe_schlitz, 0],
        [-tiefe_schlitz, kante],
        //Schlitzboden bis Rueckwand
        [0, d_zunge],
        //Rueckwand des Schlitzes
        [0, z_lippe],
        //Lippe, Spitze
        [-tiefe_schlitz, z_lippe],
        [-tiefe_schlitz, z_lippe+kante],
        //Oberseite
        [0, z_top],
        [wand, z_top],
        //Rampe, Spitze
        [wand+l_rampe, kante],
        [wand+l_rampe, 0],
    ]);
}

//Saegezaehne: flach ansteigend in Steckrichtung (+x), steile Flanke zur Rueckwand hin,
//so rutscht der Teppich leicht hinein, aber schwer wieder heraus
module haken()
{
    bk=(tiefe_schlitz-r_innen)/n_haken;
    for (i=[0:n_haken-1])
    {
        x0=-tiefe_schlitz+i*bk;
        x1=x0+bk;
        if (haken_oben)
            polygon([[x0, z_lippe], [x1, z_lippe], [x1, z_lippe-h_haken]]);
        if (haken_unten)
            polygon([[x0, z_zunge(x0)], [x1, z_zunge(x1)], [x1, z_zunge(x1)+h_haken]]);
    }
}

module profil()
{
    //Innenecken ausrunden, Aussenmasse bleiben gleich
    if (r_innen>0)
        offset(r=-r_innen) offset(delta=r_innen) profil_grund();
    else
        profil_grund();

    if (n_haken>0) haken();
}

module schiene()
{
    //Profil entlang y extrudieren
    rotate([90,0,0]) translate([0,0,-laenge]) linear_extrude(height=laenge) profil();
}

if (druck)
    //Auf die Stirnseite stellen: Profil liegt auf dem Druckbett, keine Ueberhaenge
    rotate([-90,0,0]) translate([0,-laenge,0]) schiene();
else
    schiene();
