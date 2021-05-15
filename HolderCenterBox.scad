//Durchmesser Schraube
ds=6.35; //= 1/4 Zoll
//Länge Schraubenhals
lsh=11.2;
//Höhe/Länge Schraubenkopf Total (falls wir Abstand brauchen)
hs=4.6;
//Durchmesser Beilagscheibe integriert
db=13;
//Höhe Beilagscheibe
hb=1.25;
//Durchmesser Mutternkopf
dm=10.85;
//Länge Schraube toal
lst=16.4;
//Höhe Mutternkopf
hm=lst-hb-lsh;

cylinder(h=hm, d=dm);

translate([0,0,hm])
cylinder(h=hb, d=db);

translate([0,0,hm+hb])
cylinder(h=lsh, d=ds);