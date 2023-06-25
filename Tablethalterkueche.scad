$fn=36;
//Wanddicke
wd=2.54;
//Abstand in Display
aid=7;
//Abstand hinter Tablet
ahd=20;
//Dicke dickstes Tablet
ddt=10;
//Breite Montageband
bm=25;

module abstandhalter()
{
    cube([ddt+2*wd,bm,wd]);
}

abstandhalter();

module hintertablet()
{
    translate([0,-bm/2,0])
    cube([wd,bm*2,(wd+ahd)*1.5]);
}

hintertablet();

module vortablet()
{
    translate([ddt+wd,0,0])
    cube([wd,bm,wd+aid]);
}

vortablet();