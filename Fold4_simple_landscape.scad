//Tickness
t=1.6;
//Thickness hinten
th=4.0; //wegen Kamera
//Toleranz
tow=0.8;
tod=0.8;
//Breite (ohne Tasten, geschlossen)
bg=155+tow;
// Hoehe Klebeband
hk=50+2;
// Hoehe Front
hf=21+1;
// Hoehe Halter
hh=hk*2;
//Tiefe breite Seite (geschlossen, ohne Kamera)
tbs=7.1+tod;
//Tiefe schmale Seite ("")
tss=7.1+tod;
//Abstand zum USB-Slot
ausb=3.6;

module klotz()
{
    cube([bg+t*2,tbs+t+th,hh+t]);
}

module slotusb()
{
    color("blue")
    
    translate([ausb+t,0,t])
    cube([bg-ausb*2,tbs+t,hh]);
    
    color("orange")
    
    translate([0,0,16+t])
    cube([bg+t+t,tbs+t,30]);
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
