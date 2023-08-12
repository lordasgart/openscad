t=1.0;
to=0.5;
//Breite Karte
bk=54.0;
//Dicke Karte
dk=0.5;
//Hoehe Karte
hk=85.6;
//Hoehe Cover
hc=bk/2;

module karte()
{
    cube([bk,dk,hk]);
}

//karte();

module aussparung_karte()
{
    cube([bk+to,dk+to,hk]);
}

module cover_karte()
{
     cube([bk+to+t+t, dk+to+t+t, hc+to+t+t]);
}

difference()
{
    cover_karte();
    translate([t,t,t])
    aussparung_karte();
}
