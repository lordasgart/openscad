//Breite
x=15;
//WidthKlotz
w=x+10;
//Dicke
d=1.25; //-1.35
//Innen
b=x-d;
//Schraube oben durchmesser
sod=5;
//Schraube unten durchmesser
sud=2;
//Schraubenkopflänge
skl=d;
//Klickabstand
ka=11;
//Breite-Klickabstand
kb=b-ka;
//thickness
t=d;

$fn=36;

//Kubus komplette äußere Hoehe und mit Toleranz an beiden Seiten (w), w noch anpassen

//cube([w,w,b]);

//Daraus machen wir jetzt ein Polygon (nur den queren Dreiecksteil)

linear_extrude(b)
polygon([[0,0],[0,w],[w,w]]);

//Jetzt Wände für die Schrauben hochziehen mit Versatz (d) nach hinten
module wand1()
{
    difference() {
color("green")
translate([-d,0,b])
cube([t,w,b]);

//Jetzt Bohrung mittig setzen vor Verbinder mit Klotz

color("red")
translate([0,w/2,b+b/2+t])
rotate([270,0,90])
cylinder(d, d1=sod,d2=sud);
    }
}

wand1();

//Der Verbinder hat t+t

color("yellow")
translate([0,t+t,b]) 
cube([t+t,w-t-t,t+t]);

//Wand2

module wand2()
{
    translate([0,w,0]) 
    rotate([0,0,270])
   wand1();
}
wand2();

//Connector 2

color("orange")
translate([0,w-t-t,b]) 
cube([w-t-t,t+t,t+t]);

//Connector 2

color("blue")
translate([-d,w,b]) 
cube([d,d,b]);