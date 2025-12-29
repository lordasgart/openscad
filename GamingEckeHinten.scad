//Breite Holzleiste
a=35;
//Dicke Holzleiste
b=10;
//Breite Brett
c=140;

difference()
{
    
    teil();
    schrauben();



}

module teil()
{

cube([c, a, b]);

translate([a,a,-50+b])
cube([c-a,b,50]);
}
$fn=36;

//Durchmesser Schraube oben
do=7;
//Durchmesser Schraube unten
ds=4;
//Höhe Schraubenkopf
hsk=3;

module schraube()
{
color("#6666FF")
rotate([270,0,0])
{
    cylinder(h=hsk, d1=do, d2=ds);
    translate([0,0,hsk])
    cylinder(h=b,d=ds);
}
}
module schrauben()
{
translate([c-a,a,(-50+b)/2])
schraube();

translate([a+a,a,(-50+b)/2])
schraube();
}