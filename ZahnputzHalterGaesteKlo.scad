//Wandstärke
t=2.4;

//Breite Innenbox
bi=89;
//Tiefe Innenbox
ti=36.5-t;
//Hoehe Innenbox
hi=69;

//Breite Aussenbox
ba=97;
//Tiefe Aussenbox
ta=50;
//Hoehe Aussenbox
ha=74+t;

//Abstand Innenbox zur Rueckseite
ar=4;


//Innenraum des Zahnputzhalters
module innenbox()
{
    cube([bi, ti, hi]);
}

module aussenbox()
{
    cube([ba, ta, ha]);
}

module carveouthinten()
{
    //breite bi+t+t
    //startet 2 unter der oberen platte der aussenbox
    //und ist ar tief und ha hoch
    //(+1 nach hinten damit hinten sauber offen)
    translate([(ba-bi)/2-t, ta-ar, ha-2-ha])
    cube([bi+t+t, ar+1, ha]);
}

module carveoutunten()
{
    //alles bis auf vorne, links und rechts (dicke t) weg
    //so hoch dass unter der innenbox 2 bodenplatte bleiben
    //(-1 unten und +1 hinten damit sauber offen)
    translate([t, t, -1])
    cube([ba-t-t, ta-t+1, ha-hi-2+1]);
}

module carveoutvorne()
{
    //t von vorne, links und rechts entfernt
    //bis zur vorderseite der innenbox bleiben 2 wand
    //oben bleiben 2 zur aussenbox
    //(-1 unten damit es in den carveoutunten uebergeht)
    translate([t, t, -1])
    cube([ba-t-t, ta-ar-ti-t-2-t, ha-2+1]);
}

module zahnputzhalter()
{
    difference()
    {
        aussenbox();
        //mittig in der Breite, ar von hinten, oben buendig (+1 damit oben sauber offen)
        translate([(ba-bi)/2, ta-ar-ti-t, ha-hi])
        cube([bi, ti, hi+1]);
        carveouthinten();
        carveoutunten();
        carveoutvorne();
    }
}

zahnputzhalter();
