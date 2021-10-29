//Hoehe eine Matte
hm = 10;
//Hoehe Matte Diff
hmd = -1.4;
//Tiefe Matte
tm = 66;
//Tiefe Matte Diff
tmd = -3;
//Breite Matte
bm = 118;
//Dicke weisses Brett
dwb = 5;
//Dicker Leimholzbrett
dlb = 3;


module matte()
{
    color("#777777")
    cube([bm,tm,hm]);
}

module klappmatte()
{
    matte();

    translate([0,0,hm+0.2])
    matte();

    translate([0,tm+hm+hmd,hm*2+tmd])
    rotate([70,0,0])
    matte();
}

klappmatte();

module brett_sitzflaeche()
{
    color("#BA8C63")
    translate([0,0,-dlb])
    cube([bm,tm,dlb]);
}

brett_sitzflaeche();

module brett_sitzflaeche_begrenzung_hinten_vorne(s)
{
    color("#BA8C63")
    cube([bm,dlb,hm*1.5+dlb+s]);
}

module brett_sitzflaeche_begrenzung_vorne()
{
    translate([0,-dlb,-dlb])
    brett_sitzflaeche_begrenzung_hinten_vorne(0);
}

module brett_sitzflaeche_begrenzung_hinten()
{
    translate([0,tm,-dlb])
    brett_sitzflaeche_begrenzung_hinten_vorne(4);
}

brett_sitzflaeche_begrenzung_vorne();
brett_sitzflaeche_begrenzung_hinten();