//Thermometer.scad
$fn=9;

hoeheClips=10; //10mm
durchmesserInnenClips=12; //12mm geschätzt noch messen

fiveLines=2.08;

durchmesserAussenClips=durchmesserInnenClips+fiveLines;

difference()
{
difference()
{
cylinder(h=hoeheClips, d=durchmesserAussenClips);

cylinder(h=hoeheClips, d=durchmesserInnenClips);
}

x=14;
translate([0,-durchmesserInnenClips/4,0])
cube([x, durchmesserInnenClips/2, hoeheClips]);
}