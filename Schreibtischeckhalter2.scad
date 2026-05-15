//Schreibtischeckhalter2
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

module schraube()
{
    
    {
    cylinder(h=he, d=ds);
    translate([0,0,he])
    cylinder(h=khs, d1=ds, d2=dsk);
    
    translate([0,0,he+khs])
    cylinder(h=he, d1=dsk, d2=dbit);
    }
}

module ecke()
{
cube([d2/2,d2*2,d2]);
translate([0,d2*2,0])
cube([d2*2+d2/2,d2/2,d2]);
}

module schrauben()
{
translate([-he+khs,d2,d2/2])
rotate([0,90,0])
schraube();

translate([d2/2+d2,d2*2+d2/2+he-khs,d2/2])
rotate([90,0,0])
schraube();
}

difference()
{
    ecke();
    schrauben();
}