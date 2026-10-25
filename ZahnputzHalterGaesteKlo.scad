$fn=64;

//Wandstärke
t=2.4;

//Rundungsradius (max 2, sonst bleibt oben neben der Innenbox kein Rand)
rr=1.5;

//Abstand Innenbox zur Rueckseite
ar=4;

//Hoehe der 45 Grad Schraege unter dem Deckel der hinteren Aussparung
//(innen und aussen um diese Hoehe hoeher, damit die Aussparung nicht kuerzer wird)
hf=ar;

//Breite Innenbox
bi=89;
//Tiefe Innenbox
ti=36.5-t;
//Hoehe Innenbox
hi=69+hf;

//Breite Aussenbox
ba=97;
//Tiefe Aussenbox
ta=50;
//Hoehe Aussenbox
ha=74+t+hf;

//Hoehe Sockel = Trennebene, direkt unter der Bodenplatte der Innenbox
hs=ha-hi-2;

//Welches Teil: "alles", "oberteil" (zum Drucken auf z=0), "sockel"
teil="alles";


//Innenraum des Zahnputzhalters
module innenbox()
{
    cube([bi, ti, hi]);
}

//gerundet: oben links/rechts/vorne und vorne links/rechts, rest scharf
module aussenbox()
{
    hull()
    {
        for(x=[rr, ba-rr])
        {
            //vorne senkrechte kanten
            translate([x, rr, 0])
            cylinder(r=rr, h=ha-rr);
            //vorne oben ecken
            translate([x, rr, ha-rr])
            sphere(r=rr);
            //kanten oben links/rechts bis hinten
            translate([x, ta, ha-rr])
            rotate([90,0,0])
            cylinder(r=rr, h=ta-rr);
        }
        //hinten unten scharf
        translate([0, ta-0.01, 0])
        cube([ba, 0.01, 0.01]);
    }
}

//querschnitt innenraum mit gerundeter oberkante (u=breite/tiefe, v=hoehe)
module innenprofil(u0, l)
{
    translate([u0, ha-hi])
    square([l, hi+1]);
    difference()
    {
        translate([u0-rr, ha-rr])
        square([l+rr+rr, rr+1]);
        translate([u0-rr, ha-rr])
        circle(r=rr);
        translate([u0+l+rr, ha-rr])
        circle(r=rr);
    }
}

//innenbox als carveout mit den vier oberen kanten gerundet
//(+1 oben damit oben sauber offen)
module innenraum()
{
    x0=(ba-bi)/2;
    y0=ta-ar-ti-t;
    intersection()
    {
        //rundung links/rechts, entlang y
        translate([0, y0+ti+rr, 0])
        rotate([90,0,0])
        linear_extrude(ti+rr+rr)
        innenprofil(x0, bi);
        //rundung vorne/hinten, entlang x
        translate([x0-rr, 0, 0])
        rotate([90,0,90])
        linear_extrude(bi+rr+rr)
        innenprofil(y0, ti);
    }
}

module carveouthinten()
{
    //breite bi+t+t
    //startet 2 unter der oberen platte der aussenbox
    //und ist ar tief und geht unten durch
    //oben 45 grad schraege nach hinten ansteigend, damit ohne bruecke druckbar
    //(+1 nach hinten und -1 unten damit sauber offen)
    translate([(ba-bi)/2-t, 0, 0])
    rotate([90,0,90])
    linear_extrude(bi+t+t)
    polygon([[ta-ar, -1], [ta-ar, ha-2-hf], [ta, ha-2], [ta+1, ha-2], [ta+1, -1]]);
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
    //oben 45 grad schraege nach vorne ansteigend, damit ohne bruecke druckbar
    //(-1 unten damit es in den carveoutunten uebergeht)
    d=ta-ar-ti-t-2-t;
    translate([t, 0, 0])
    rotate([90,0,90])
    linear_extrude(ba-t-t)
    polygon([[t, -1], [t, ha-2], [t+d, ha-2-d], [t+d, -1]]);
}

module zahnputzhalter()
{
    difference()
    {
        aussenbox();
        //mittig in der Breite, ar von hinten, oben buendig
        innenraum();
        carveouthinten();
        carveoutunten();
        carveoutvorne();
    }
}

//U-Rahmen unter der Bodenplatte
module sockel()
{
    intersection()
    {
        zahnputzhalter();
        translate([-1, -1, -1])
        cube([ba+2, ta+2, hs+1]);
    }
}

//alles ab der Bodenplatte, steht flach auf dem Druckbett
module oberteil()
{
    translate([0, 0, -hs])
    intersection()
    {
        zahnputzhalter();
        translate([-1, -1, hs])
        cube([ba+2, ta+2, ha]);
    }
}

if(teil=="oberteil") oberteil();
else if(teil=="sockel") sockel();
else zahnputzhalter();
