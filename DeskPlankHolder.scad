include <PrusaImport.scad>

//Thickness
t=wt8; //8 lines, as the connector on the desk is about 3.3 this is a good value not to scratch the wood with attached connector...

spar=14;
wood=18;

//left
cube([t,spar,spar]);

//top
translate([0,0,spar])
cube([spar+t+t,spar,t]);

//right
translate([spar+t,0,0])
cube([t,spar,spar]);

//bottom
translate([spar+t+t,0,0])
cube([wood, spar, t]);