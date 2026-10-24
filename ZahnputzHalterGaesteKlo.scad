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
}

module zahnputzhalter()
{
    difference()
    {
        aussenbox();
        //mittig in der Breite, ar von hinten, oben buendig (+1 damit oben sauber offen)
        translate([(ba-bi)/2, ta-ar-ti-t, ha-hi])
        cube([bi, ti, hi+1]);
    }
}

zahnputzhalter();
