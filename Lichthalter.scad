//Titel
title="Lichthalter";

//Tiefe Halter (geschätzt)
th=13.5;

//Durchmesser Halter (geschätzt)
dh=12;

//Durchmesser Böbel (geschätzt)
db=2.8;

$fn=90;

module aussparung()
{
    cylinder(h=th, d=db);    
}

module grundelement()
{
    difference()
    {
        cylinder(h=th, d=dh);
        
        translate([dh/2,0,0])
        aussparung();
        
        translate([-dh/2,0,0])
        aussparung();
        
        translate([0,dh/2,0])
        aussparung();
        
        translate([0,-dh/2,0])
        aussparung();
    }
}

grundelement();
