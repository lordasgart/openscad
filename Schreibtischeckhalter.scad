//Schreibtischeckhalter
$fn=90;
//Dicke Schreibtischplatte
d1=37;
//Dicke Brett
d2=18.5;
//Dicke Schreibtischplatte hinten ab Blech noch
d3=15;
//Dicke Blech
db=2.3;
//Durchmesser Schraube
ds=3.4;
//Kopfhöhe Schraube
khs=2.5;
//Durchmesser Schraubenkopf
dsk=6.5;
//Durchmesser Bit
dbit=8;


//Höhe Eckhalter
he=d1-d2;
//Breite Eckhalter
be=he; //wir nehmen mal die Höhe als Breite auch
te=he; //hier genauso

module eckhalter_basis()
{
translate([0,he,0])
rotate([90,0,0])
linear_extrude(he)
polygon([[0,0],[0,he],[he,he]]);
}

module schraube()
{
    rotate([0,90,0])
    {
    cylinder(h=he, d=ds);
    translate([0,0,he])
    cylinder(h=khs, d1=ds, d2=dsk);
    
    translate([0,0,he+khs])
    cylinder(h=he, d1=dsk, d2=dbit);
    }
}

difference()
{
eckhalter_basis();

translate([-he+khs,he/2,he/2])
schraube();
}