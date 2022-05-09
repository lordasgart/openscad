include <PrusaImport.scad>

//Thickness
t=wt8; //8 lines, as the connector on the desk is about 3.3 this is a good value not to scratch the wood with attached connector...

//spar = 14;
spar=14*1; //variante 2 mit kulanz für blende
wood=18;

//left
difference()
{
    cube([t,spar,spar]);
    translate([0,0,spar/4])
    cube([t,spar,spar/2]);
}


//top
translate([0,0,spar])
cube([spar+t+t,spar,t]);

//right
translate([spar+t,0,0])
cube([t,spar,spar]);

//bottom 1
//translate([spar+t+t,0,0])
//cube([wood, spar, t]);

//bottom 2
translate([0,0,-t])
cube([spar+t+t,spar,t]);

translate([0,0,-t])
cube([spar+t+t,2,spar+t+t]);