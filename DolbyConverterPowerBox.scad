//Durchmesser Hohlbuchse
d=7.7;
//Breite Schalter
w=12.8;
//Höhe Schalter
h=19.4;
//Durchmesser Kabel
dk=3.5;
//Thickness Wände
t=1.2;
//Abstand zu den Seiten
a=16;
//Tiefe Schalter und Stecker
ts=25;
$fn=36;

module aussparung_schalter()
{
    color("gray")
    cube([w,t+ts,h]);
}

module wand_schalterseite()
{
cube([w+a,t,h+a]);    
}

module wand_vorne()
{
    difference()
    {
//vorne
wand_schalterseite();
translate([a/2,0,a/2])
aussparung_schalter();
}
}

module wandobenunten()
{
cube([w+a,w+a+ts,t]);
}

module wand_hinten()
{
    //hinten
translate([0,w+a+ts-t,0])
wand_schalterseite();
}

module wand_unten()
{
    difference()
    {
wandobenunten();
color("gray")
translate([(w+a)/2,(w+a)/2+ts,0])
cylinder(h=t+ts, d1=d, d2=d);

    }}

module wand_oben()
{
    difference()
    {
translate([0,0,h+a])
wandobenunten();

color("gray")
translate([(w+a)/2,(w+a)/2+ts,h+a])
cylinder(h=t, d1=dk, d2=dk);
}
}


module connector()
{
    translate([t,0,0])
cube([w+a-t*2,a/3,a/3]);
}

module connectorvornenunten()
{
translate([0,t,t])
connector();
}

module connectorhintenunten()
{
translate([0,w+a+ts-a/3-t,t])
connector();
}

module connectorvorneoben()
{
translate([0,t,h+a-a/3])
connector();
}

module connectorhintenoben()
{
translate([0,w+a+ts-a/3-t,h+a-a/3])
connector();
}

module wandseite()
{
translate([0,t,t])
color("blue")
cube([t,w+a+ts-t*2,h+a-t]);
}

module wandlinks()
{
wandseite();
}

module wandrechts()
{
translate([w+a-t,0,0])
wandseite();
}

wand_oben();
connectorvorneoben();
connectorhintenoben();

//wand_unten();
//connectorvornenunten();
//connectorhintenunten();

//wand_vorne();
//wand_hinten();
//wandlinks();
//wandrechts();
