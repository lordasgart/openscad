$fn=90;
//Dicke untere Platte
t1=1.4;
//Dicke Lochebene (wenn wir die brauchen)
t2=2.5;
//Durchmesser Knubbel Messer
dk=8.5;
//Durchmesser Loch mitte Messer
dlm=18.2;
//Abstand Knubbel zu Knubbel außen Messer
akk=53.4;
//Dicke Messer
dm=3.0;
//Lochdurchmesser
ld=11.0;
//Ring innen Durchmesser
rid=17.6;
//Ringebene Durchmesser
red=40.0;
//Abstand Ohr zu Ohr außen
aoo=57.0;
//Zusatz für Ohrbreite zu dk (einfach mal t2, hört sich gut an, oder fester Wert geschätzt)
zob=3.8;
//Ohrbreite (nicht gemessen, blöd, aber mindestens dk)
ob=dk+zob;
//Versatz Knubbel
vk=akk/2-dk/2;

module part()
{
//Ebene
cylinder(h=t1, d=red);
//Ohren
translate([0,0,t1/2])
cube([57,ob,t1], center=true);
//Knubbel
module knubbel()
{
    color("blue")
cylinder(h=t1+dm, d=dk);
}
translate([vk,0,0])
knubbel();
translate([-vk,0,0])
knubbel();
}

difference()
{
    part();
    
//Ring
cylinder(h=t1+t2, d=rid);
}