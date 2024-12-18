//Tickness
t=1.6;
//Thickness hinten
th=4.0; //wegen Kamera
//Toleranz
tow=1;
tod=1;
//Breite (ohne Tasten, geschlossen)
bg=67.4+tow;
// Hoehe Klebeband
hk=25+1;
// Hoehe Halter
hh=hk*2;
//Tiefe breite Seite (geschlossen, ohne Kamera)
tbs=16.2+tod;
//Tiefe schmale Seite ("")
tss=14+tod;
//Abstand zum USB-Slot
ausb=21;

module klotz()
{
    cube([bg+t*2,tbs+t+th,hh+t]);
}

module slotusb()
{
    color("blue")
    
    translate([ausb+t,0,0])
    cube([bg-ausb*2,tbs+t,hh+t]);
}

module slothandy()
{
    color("red")
    
    translate([t,t,t])
    cube([bg,tbs,hh]);
}

difference()
{
    klotz();
    slotusb();
    slothandy();
}
