//Leiste mit nach vorne gewoelbter Ausbuchtung, die bis zum Boden reicht.
//Die Ausbuchtung ist nach hinten und nach unten offen.
//Profil von der Seite (vorne links, hinten rechts):
//
//        ██
//        ██
//  ████████
//  ██
//  ██
//  ██

/* [Masse] */

//Gesamthoehe der Leiste inkl. Ausbuchtung
hoehe_leiste=15.5; // [5:0.1:50]

//Hoehe der Ausbuchtung, innen gemessen vom Boden
hoehe_ausbuchtung=9; // [3:0.1:50]

//Tiefe der Ausbuchtung, innen gemessen ab Rueckseite der Leiste
tiefe_ausbuchtung=7.5; // [3:0.1:50]

//Breite der gesamten Leiste
breite_leiste=318; // [10:1:500]

//Dicke der Leiste oben und der Wand um die Ausbuchtung
dicke=2.4; // [0.4:0.1:5]

//Radius der vorderen Kante ganz oben und der vorderen Kante der Ausbuchtung
//(wird auf die Dicke und die freie Hoehe der Leiste begrenzt)
radius=1.2; // [0.1:0.1:5]

/* [Druck] */

//Welches Teil: "alles" oder ein Drittel. Links und rechts sind aussen geschlossen, die Mitte ist beidseitig offen.
teil="alles"; // [alles, links, mitte, rechts]

/* [Hidden] */

//Radius darf nicht groesser als die Wand oder die freie Hoehe der Leiste sein
r=min(radius, dicke, hoehe_leiste-hoehe_ausbuchtung-dicke);

//Segmente pro Rundung
segmente=16;

//Viertelkreis um [cx, cy] von Winkel a0 nach a1
function bogen(cx, cy, a0, a1) =
    [for(i=[0:segmente]) let(a=a0+(a1-a0)*i/segmente) [cx+r*cos(a), cy+r*sin(a)]];


module profil()
{
    polygon(concat(
        [[tiefe_ausbuchtung+dicke, hoehe_leiste]],
        //vordere Kante ganz oben
        bogen(tiefe_ausbuchtung+r, hoehe_leiste-r, 90, 180),
        [[tiefe_ausbuchtung, hoehe_ausbuchtung+dicke]],
        //vordere Kante der Ausbuchtung
        bogen(r, hoehe_ausbuchtung+dicke-r, 90, 180),
        [
            [0, 0],
            [dicke, 0],
            [dicke, hoehe_ausbuchtung],
            [tiefe_ausbuchtung+dicke, hoehe_ausbuchtung]
        ]
    ));
}

//Profil mit gefuellter Ausbuchtung, verschliesst die Seite
module deckel()
{
    union()
    {
        profil();
        translate([dicke, 0])
        square([tiefe_ausbuchtung, hoehe_ausbuchtung]);
    }
}

//x = Breite, y = Tiefe (y=0 ist vorne), z = Hoehe
module leiste(laenge, links_zu, rechts_zu)
{
    rotate([90,0,90])
    {
        linear_extrude(height=laenge)
        profil();

        if(links_zu)
        linear_extrude(height=dicke)
        deckel();

        if(rechts_zu)
        translate([0, 0, laenge-dicke])
        linear_extrude(height=dicke)
        deckel();
    }
}

if(teil=="links")
    leiste(breite_leiste/3, true, false);
else if(teil=="mitte")
    leiste(breite_leiste/3, false, false);
else if(teil=="rechts")
    leiste(breite_leiste/3, false, true);
else
    leiste(breite_leiste, true, true);
