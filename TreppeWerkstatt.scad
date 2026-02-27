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

module Brett()
{
    color("#aa5500")
    cube([195,39,3000]);
}

Brett();

translate([0,1000,0])
Brett();

module Wand()
{
    translate([-339,-600,0])
    color("#ffda82")
    cube([300,3000,2350]);
}

Wand();

module Holzwand()
{
    translate([-300,-600,2350])
    color("#4c2600")
    cube([300,3000,2350]);
}

Holzwand();

module MaximalLinie()
{
    translate([900,0,0])
    color("#0055ff")
    cube([10,1000,10]);
}

MaximalLinie();