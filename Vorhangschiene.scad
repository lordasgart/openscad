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

difference()
{
    cube([b,t,l]);
    gleiterkanal();
    materialaussparung();
}
