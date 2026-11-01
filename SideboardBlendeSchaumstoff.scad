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

//Breite der Leiste
breite_leiste=319; // [10:1:500]

//Dicke der Leiste oben und der Wand um die Ausbuchtung
dicke=2.4; // [0.4:0.1:5]


module profil()
{
    polygon([
        [tiefe_ausbuchtung+dicke, hoehe_leiste],
        [tiefe_ausbuchtung, hoehe_leiste],
        [tiefe_ausbuchtung, hoehe_ausbuchtung+dicke],
        [0, hoehe_ausbuchtung+dicke],
        [0, 0],
        [dicke, 0],
        [dicke, hoehe_ausbuchtung],
        [tiefe_ausbuchtung+dicke, hoehe_ausbuchtung]
    ]);
}

//x = Breite, y = Tiefe (y=0 ist vorne), z = Hoehe
rotate([90,0,90])
linear_extrude(height=breite_leiste)
profil();
