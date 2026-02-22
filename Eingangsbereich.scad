//Eingangsbereich

//150cmx250cm

//(1500x2500) mm

//Ideen: Lüftung, Schiene, Katzentüre

w=1500;
h=2500;

//Dicke Holz (Hasutüre 36cm)
t=360; //wieviel Platz haben wir wirklich zur Garage?

translate([0,t,0])
cube([w, t, h]);

//Größe Haustüre
hh=2100;
bh=1100;
//Abstand Rahmen
ar=100;

translate([w-ar*2-bh,0,0]) //da kann ich es ja gleich mittig setzen, dann aber mit genauen Maßen 1450?
color("white")
cube([bh,t,hh]);