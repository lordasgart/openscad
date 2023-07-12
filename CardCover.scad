t=1.4;
to=1;
//Breite Karte
bk=51.4;
//Dicke Karte
dk=0.5;
//Hoehe Karte
hk=84.9;
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
