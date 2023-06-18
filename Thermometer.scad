//Thermometer.scad
$fn=90;
//ThermometerV2.scad
$fn=36;

hoeheClips=10; //10mm
durchmesserInnenClips=16.1; //12mm geschätzt noch messen

durchmesserInnenClips=15.5; //15.5mm geschätzt noch messen

fiveLines=2.08;

durchmesserAussenClips=durchmesserInnenClips+fiveLines;

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

x=14;
translate([0,-durchmesserInnenClips/4,0])
cube([x, durchmesserInnenClips/2, hoeheClips]);
}