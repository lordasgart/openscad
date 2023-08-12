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
hh=hk*2-18;
//Tiefe breite Seite (geschlossen, ohne Kamera)
tbs=7.1+tod;
//Tiefe schmale Seite ("")
tss=7.1+tod;
//Abstand zum USB-Slot
ausb=3.6;

$fn=36;

module klotz()
{
    cube([bg+t*2,tbs+t+th,hh+t]);
}

sz1=16;
sz2=30;

module slots()
{
    //front
    color("blue")
    
    translate([ausb+t,0,t])
    cube([bg-ausb*2,tbs+t,hh]);
    
    //speakers
    color("orange")
    
    translate([0,0,sz1+t])
    cube([bg+t+t,tbs+t,sz2]);
    
    speaker_z_side();
    
    speaker_z_front();
    
    translate([bg+t-ausb*2-t,0,0])
    speaker_z_front();
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
    slothandy();
    slots();
}

q=tbs*2+t+t;

module speaker_z_side()
{
color("green")
translate([0,tbs/2-th,sz1+sz2+t])
rotate([0,90,0])
    cylinder(h=bg+t*2, d=q);
}

module speaker_z_front()
{
translate([ausb+t,0,sz1+sz2+tbs+ausb])
rotate([270,0,0])
color("gray")
cylinder(h=t, d=ausb*2);
}


