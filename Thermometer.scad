//ThermometerV2.scad
$fn=36;

hoeheClips=10; //10mm

durchmesserInnenClips=15.5; //15.5mm geschätzt noch messen

fiveLines=2.08;

difference()
{
difference()
{

    clips();
    //innen
    cylinder(h=hoeheClips,d=durchmesserInnenClips);
   
}
cut();
}
    
module clips()
{
    //außen
    cylinder(h=hoeheClips,d=durchmesserInnenClips+fiveLines);
    
    translate([-0.5,0,0])
    connector();
}

module connector()
{
difference()
{

translate([durchmesserInnenClips/2,0,hoeheClips/2])
    rotate([0,90,0])
    cylinder(h=3+fiveLines, d=hoeheClips);
    
    translate([durchmesserInnenClips/2+fiveLines,0,hoeheClips/2])
    rotate([0,90,0])
    cylinder(h=3, d=6.5);
}
}

module cut()
{
f=0.9;
translate([-durchmesserInnenClips,-durchmesserInnenClips*f/2,0])
cube([durchmesserInnenClips,durchmesserInnenClips*f,hoeheClips]);
}