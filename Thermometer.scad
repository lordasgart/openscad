//Thermometer.scad
$fn=90;

hoeheClips=10; //10mm
durchmesserInnenClips=16.1; //12mm geschätzt noch messen

fiveLines=2.08;
t=fiveLines;

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

dc=6.5;
hc=3.5;

difference()
{
translate([-durchmesserAussenClips/2-hc+t*0.50,0,hoeheClips/2])
rotate([90,0,90])
cylinder(h=hc, d=hoeheClips);

translate([-durchmesserAussenClips/2-hc+t*0.50,0,hoeheClips/2])
rotate([90,0,90])
cylinder(h=hc, d=dc);
}
