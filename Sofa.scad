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
dwb = 2;
//Dicker Leimholzbrett
dlb = 2;

//Rotation
r = 70;

//194x92,5x2 1x
//180x18x2   2x
//180x8x2    1x

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
    rotate([r,0,0])
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

module brett_sitzflaeche_begrenzung_hinten_vorne(s, isWhitePlank)
{
    if (isWhitePlank)
    {
        //color("#BA8C63")
        cube([bm,dwb,hm*0.5+dwb+s]);
    }
    else
    {
        color("#BA8C63")
        cube([bm,dlb,hm*0.5+dlb+s]);   
    }
}

module brett_sitzflaeche_begrenzung_vorne()
{
    translate([0,-dwb,-dlb])
    brett_sitzflaeche_begrenzung_hinten_vorne(0, true);
}

module brett_sitzflaeche_begrenzung_hinten()
{
    translate([0,tm,-dlb])
    brett_sitzflaeche_begrenzung_hinten_vorne(1, false);
}

brett_sitzflaeche_begrenzung_vorne();
brett_sitzflaeche_begrenzung_hinten();

module brett_hinten()
{
    color("#BA8C63")
    
    translate([0,tm+4,-2])
    rotate([r,0,0])
    cube([bm,tm+6,dlb]);
}

brett_hinten();

rotate([33,0,0])
translate([bm,9,-8])
cube([dlb,tm*1.4,dlb]);
