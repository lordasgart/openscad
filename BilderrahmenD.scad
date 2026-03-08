//BilderrahmenD

include <BOSL2/std.scad>

$fn=36;

{ /*Bild*/
    //Dicke Bild
    d=1; //0.2 for real rendering !!!
    //Width Bild
    w=155;
    //Height Bild
    h=92;
}
{ /*Rahmen*/
    //Rahmendicke
    rd=10;
    //
    t=5;

    //Überlappung
    u=2;

    r=2;
    
    //Toleranz Einlagefach
    tef=0.5;
}

module blatt()
{
    color("#EEEEEE")
    cuboid([w,h,d]);
}

module rahmenrohblock()
{
    color("#444444")
    cuboid([w+rd*2-u*2,h+rd*2-u*2,t], rounding=r);
}

//rahmenrohblock();

module blattobendrauf()
{
    translate([0,0,t/2-d/2+d])
    blatt();
}

module bilderrahmen()
{
    difference()
    {        
        rahmenrohblock();
        translate([0,0,t/4])
        cuboid([w-u*2,h-u*2,t/2]);
    }
}

//bilderrahmen();
//blattobendrauf();

module rahmenoben()
{
    difference()
    {
        bilderrahmen();
        translate([0,0,-t/2])
        cuboid([w+rd*2-u*2,h+rd*2-u*2,t]);
    }
}

module rahmenunten()
{
    difference()
    {
        bilderrahmen();
        translate([0,0,t/2])
        cuboid([w+rd*2-u*2,h+rd*2-u*2,t]);
    }
}

module rahmenuntenmitblatteinlage()
{
    difference()
    {
        rahmenunten();
        translate([0,0,-d/2])
        cuboid([w+tef*2,h+tef*2,d]);
    }
}

rahmenuntenmitblatteinlage();
//rahmenoben();
