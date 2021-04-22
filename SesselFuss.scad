$fn=90;
//Gesamte Höhe Schraubenhalter
ghs=12;
//Obere Höhe Schraubenhalter
ohs=4.4;
//Untere Höhe Schraubenhalter
uhs=ghs-ohs;
//Oberer Schraubenhalter Durchmesser
osd=5.35;
//Unterer Schraubenhalter Durchmesser
usd=7.85;
//Durchmesser Fuß
df=50.5;
//Durchmesser Standfläche
ds=41.5;
//Höhe Fuß Total
hft=25.1;
//Höhe Fuß bis Standfläche Rundung
hfs=21.5;
//Oberes Loch Durchmesser, Öffnung Schraube in Fuß Durchmesser
old=14;
//Versatz oberes Loch
vol=0.4;
//durchmesser ring oberes loch
drol=17.5;

//Das ist die grobe Hülle von dem ganzen Fuß, ohne Rundungen, ohne alles, als Kontrolle
//cylinder(h=hft, d=df);


//So jetzt der Fuß mit einer abgerundeten Standfläche
module rounderfoot()
{
hull() {
cylinder(h=hfs, d=df);

translate([0,0,hfs])
cylinder(h=hft-hfs, d=ds);
}
}

module bohrung()
{
//Jetzt die drei Löcher durchbohren, dünn, mittel, dick, ganz dick (ring oben)
//dünn (ist aber weiter oben)
translate([0,0,uhs])
cylinder(h=ohs,d=osd);

//mittel
translate([0,0,0])
cylinder(h=uhs,d=usd);

//dick
translate([0,0,ohs+uhs])
cylinder(h=hft-ohs-uhs,d=old);

//ring
translate([0,0,hft-vol])
cylinder(h=vol,d=drol);
}

difference()
{
    rounderfoot();
    bohrung();
}