//Welches Teil anzeigen (zusammen = Gleiter in der Schiene, nur zur Kontrolle)
teil="zusammen"; // [schiene, gleiter, zusammen]

/* [Schiene] */

//Breite Schiene
b=28;
//Tiefe Schiene
t=9;
//Laenge Schiene
l=50;

//Breite Schlitz
bs=6.4;
//Tiefe Schlitz (ab Vorderseite)
ts=6.4;
//Abstand Schlitz zum rechten Rand
ar=4;

//Ueberstand Gleiterkanal links und rechts neben dem Schlitz
uk=2;
//Staerke der Lippe vor dem Gleiterkanal
sl=2;

//Wandstaerke um die Materialaussparung links
wm=2;

/* [Schraubloecher] */

//Durchmesser Gewinde Spax (Loch in der Rueckwand)
sd=3.2;
//Durchmesser Spax-Senkkopf (Spax 3.0 = 6.0, plus etwas Spiel)
sk=6.2;
//Durchmesser Loch vorne fuer Bit und Schraubenkopf (1/4" Bit ca. 7.1 ueber Ecken)
db=7.6;
//Abstand Schraubloecher vom oberen und unteren Ende
ae=10;

/* [Gleiter] */

//Spiel zwischen Gleiter und Schiene pro Seite
sp=0.3;
//Laenge Gleiter (in Schienenrichtung)
lg=12;
//Wie weit der Gleiter vorne aus der Schiene herausragt
ag=10;
//Durchmesser Loch fuer den Haken
dl=4;
//Materialstaerke unter dem Loch
wl=2;
//Rundungsradius vorne am Gleiter (max halbe Stegbreite)
rg=1.5;

/* [Hidden] */

//Tiefe der Senkung, ergibt sich aus dem 90 Grad Senkkopf (muss kleiner als wm sein)
skh=(sk-sd)/2;

$fn=64;

//Hohlraum links neben dem Gleiterkanal, durchgehend ueber die ganze Laenge, spart Material
module materialaussparung()
{
    translate([wm,wm,0])
    cube([b-ar-bs-uk-2*wm,t-2*wm,l]);
}

//Aussparung fuer die Gleiter: Schlitz vorne, breiterer Kanal dahinter
module gleiterkanal()
{
    translate([b-ar-bs,0,0])
    cube([bs,ts,l]);

    translate([b-ar-bs-uk,sl,0])
    cube([bs+2*uk,ts-sl,l]);
}

//Je oben und unten mittig in der Materialaussparung: Senkloch fuer die Spax in der Rueckwand,
//vorne ein groesseres Loch, durch das Schraube und Bit passen
module schraubloecher()
{
    for (z=[ae, l-ae])
    translate([wm+(b-ar-bs-uk-2*wm)/2,0,z])
    rotate([-90,0,0])
    {
        //vorne: Bit-Loch
        translate([0,0,-1])
        cylinder(d=db,h=wm+2);

        //hinten: Gewindeloch
        translate([0,0,t-wm-1])
        cylinder(d=sd,h=wm+2);

        //hinten: Senkung fuer den Kopf, von innen in die Rueckwand
        translate([0,0,t-wm-0.01])
        cylinder(d1=sk,d2=sd,h=skh+0.01);
    }
}

module schiene()
{
    difference()
    {
        cube([b,t,l]);
        gleiterkanal();
        materialaussparung();
        schraubloecher();
    }
}

//Gleiter in Schienenkoordinaten, mittig auf x=0, Kopf liegt auf der Lippe auf.
//Druck stehend wie dargestellt, dann gibt es keine Ueberhaenge.
module gleiter()
{
    difference()
    {
        union()
        {
            //Kopf im Gleiterkanal
            translate([-(bs+2*uk)/2+sp,sl,0])
            cube([bs+2*uk-2*sp,ts-sl-sp,lg]);

            //Steg durch den Schlitz bis unter die Schiene, vorne abgerundet.
            //Kugeln um rg nach innen versetzt, damit die Aussenmasse gleich bleiben.
            hull()
            {
                translate([-bs/2+sp,-ag+rg,0])
                cube([bs-2*sp,ag+sl-rg,lg]);

                for (x=[-bs/2+sp+rg, bs/2-sp-rg], z=[rg, lg-rg])
                translate([x,-ag+rg,z])
                sphere(r=rg);
            }
        }

        //Loch fuer den Haken, quer zur Schiene
        translate([0,-ag+wl+dl/2,lg/2])
        rotate([0,90,0])
        cylinder(d=dl,h=bs,center=true);
    }
}

if (teil=="schiene")
    schiene();
else if (teil=="gleiter")
    gleiter();
else
{
    schiene();
    color("orange")
    translate([b-ar-bs/2,0,(l-lg)/2])
    gleiter();
}
