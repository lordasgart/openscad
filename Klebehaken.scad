t=2.4;
//Breite Doppelklebeband
bdk=26;//25.2;
//Breite Klebefläche
bk=bdk*2;
hk=bk;
//Breite Hakenfläche
bh=bk/3;
//Tiefe Hakenfläche
th=bk/3;
//Hakenhoehe
hh=hk/3;

module klebeflaeche()
{
    cube([bk,hk,t]);
}

klebeflaeche();

module hakenflaeche()
{
    translate([bk/2-bh/2,0,t])
    cube([bh,t,th]);
}



module hakenhoehe()
{
    translate([bk/2-bh/2,0,th+t])
    cube([bh,hh,t]);
}

//hakenflaeche();
//hakenhoehe();

difference()
{
color("blue")
translate([bk/2-bh/2,0,t])
cube([bh,hh,th+t]);

color("red")
translate([bk/2-bh/2,th/2+t,th/2+t])
rotate([0,90,0])
cylinder(h=bh, d=th);

color("orange")
translate([bk/2-bh/2,hh/2+t,t])
cube([bh,hh,th+t]);
}