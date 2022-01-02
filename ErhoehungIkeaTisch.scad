//Fussbreite
fb=100;
//Fusstiefe
ft=100;
//Fusserhöhung (Schinken)
fh=120;
//Thickness Wände
t=1.26; //3 lines => Dicker als Kreditkarte!
//Höhe Etagenplatten
h=1.2;

///DAS UNTERE MUSS EIN MASSIVER BLOCK WERDEN
//INFILL DANN IM SLICER SETZEN

//oben
//color("#444444")
//translate([-t,-t,fh-h])
//cube([fb+t*2,ft+t*2,h]);

//unten
//color("#444444")
//translate([-t,-t,0])
//cube([fb+t*2,ft+t*2,h]);

module cube_ohne_deckel(ch)
{
//vorne
translate([0,-t,0])
cube([fb,t,ch]);

//hinten
translate([0,ft,0])
cube([fb,t,ch]);

//links
translate([-t,0,0])
cube([t,ft,ch]);

//rechts
translate([fb,0,0])
cube([t,ft,ch]);

//links vorne
color("#FF0000")
translate([-t,-t,0])
cube([t,t,ch]);

//rechts vorne
color("#FF0000")
translate([fb,-t,0])
cube([t,t,ch]);

//rechts hinten
color("#FF0000")
translate([fb,ft,0])
cube([t,t,ch]);

//links hinten
color("#FF0000")
translate([-t,ft,0])
cube([t,t,ch]);
}

//cube_ohne_deckel(fh);
translate([-t,-t,0])
cube([fb+t*2,ft+t*2,fh]);

translate([0,0,fh-t])
cube_ohne_deckel(50);