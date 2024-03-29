$fn=90;
//Höhe Spax-Schraubenkopf
sk=1.7;
//Spax oben
so=5.0;
//Spax Durchmesser Gewinde
sd=3.0;
//Spax Höhe Gewinde
shg=10;
//Schraubenzieher-Zusatz, damit man oben bequem hinkommt, In der Mitte Loch und links rechts nochmal so viel Platz wie das Gewinde
sz=so+sd*2;

//Thickness
t=2.96;//1.7+1.1;//=2.8 ==> recommended from slicer 2.96

//################

//Höhe Bauelement
//h=27; //Switch
//h=20; //Server
//h=26; //USB-Hub
h=25; //Card-Reader

//Breite L/R unten
//lr=4; //Switch
//lr=15; //Server
//lr=15; //USB-Hub
lr=0; //Card-Reader

//################

//Tiefe
d=sz*1; //Muss mindestens sz*1 sein, damit vorne hinten genauso viel Abstand zu Schraube ist, wie links rechts

module spax()
{    
    color("silver")
        {        
        cylinder(h=t,d1=so,d2=sd);
        
        translate([0,0,0])
        cylinder(h=shg,d1=sd,d2=sd);
        }
}

module spax_oben()
{
    translate([-sz/2,d/2,h+t])
    spax();
}

module halter_bauteil()
{
    cube([lr,d,t]);
}

module abstand_halter()
{
    color("red")
    translate([lr,0,0])
    cube([t,d,h+t*2]); //z = Höhe des Bauteils + Thickness*2 von den anderen zwei Haltern
}

module zusatz_tischplatte()
{
    color("green")
    translate([-sz,0,0])
    cube([sz,d,t]);
}

module halter_tischplatte()
{
    translate([0,0,h+t])
    {    
        halter_bauteil();
        zusatz_tischplatte();
    }
}

module bauteil_komplett()
{
    halter_bauteil();
    abstand_halter();
    halter_tischplatte();
}

module computerschraube_seite()
{
    //Abstand Lochzentrum von Höhe zu Oberkante Bauteil, bzw. von unten fürs translate
    alz=25-20.5;
    
    rotate([0,270,0])
    translate([alz,d/2,-t])
    spax();
}

difference()
{
    bauteil_komplett();
    spax_oben();
    computerschraube_seite();
}