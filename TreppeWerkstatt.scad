//TreppeWerkstatt

/*
235
hoehe links wand
300
brett länge
39 40
dicke brett
19.5
breite brett
90
brett vorne zu wand (wie leiter) eher kleiner
35 39
Holzwand
*/

//Breite Leiterstufen
bl=750;
//Breite Brett
bb=195;
//Dicke Brett
db=39;
//Höhe Brett
hb=3000;
//Breite Wand
bw=4000;
//Dicke Wand
dw=300;
//Brett vorne zu Wand
bvw=39;
//Versatz Wand (für die optische Bearbeitung)
vw=-1500;
//Höhe Holzwand
hh=2350;
//Maximaler Abstand Leiterende
male=900;
//Dicke Begrenzungslinie
dbl=5;

module Brett()
{
    color("#aa5500")
    cube([bb,db,hb]);
}

module LattenVorlage()
{
    difference()
    {
        translate([719,0,-72.9])
        rotate([0,-22.0,0])
        color("#666666")
        Brett();
        BodenStein();
        Wand();
        Holzwand();
        Holzwand2();
    }
}

module Seitenbretter()
{
    Brett();
    translate([0,bl,0])
    Brett();
}

module Wand()
{
    translate([-dw-bvw,vw,0])
    color("#ffda82")
    cube([dw,bw,hh]);
}

Wand();

module Holzwand()
{
    translate([-dw,vw,hh])
    color("#4c2600")
    cube([dw,bw,hh]);
}

Holzwand();

module Holzwand2()
{
    translate([-dw,0,0])
    color("#5d3711")
    Holzwand();
}

module MaximalLinie()
{
    translate([male,0,0])
    color("#0055ff")
    cube([dbl,bl,dbl]);
}

MaximalLinie();

translate([719,0,-72.9])
rotate([0,-22.0,0])
Seitenbretter();

module BodenStein()
{
    translate([500,0,-500])
    cube([500, bl+db, 500]);
}

BodenStein();

translate([+719,0,337])
rotate([0,22.0,0])
LattenVorlage();

hhe=130; //13cm Höhe Holzwand-Einstieg
be=614; //61,4 cm Breite Einstieg

module Messlatte1()
{
    translate([1560,0,0])
    color("red")
    cube([10,10,2510]);
}

Messlatte1();

module Messlatte2()
{
    translate([1340,0,80])
    color("green")
    cube([10,10,1930]);
}

Messlatte2();

