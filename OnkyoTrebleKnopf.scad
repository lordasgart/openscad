$fn=90;
//Durchmesser Knopf Innen
dki=20.3;
//Durchmesser Knopf Aussen Oben
dkao=22.2;
//Durchmesser Knopf Aussen Unten
dkau=21.4;
//Knopf Innen Abstand Schaumstoff
kias=20.0; //23.5 Original, muss aber nicht ganz "rinter"
//Knopf Innen Abstand Wand
kiaw=16.1;
//Knopf Aussen Abstand Blende
kaab=17.7;
//Knopf Aussen Abstand Wand
kaaw=17.3;
//Knopfhoehe Oben
kho=7.5;
//Durchmesser Blende
db=27.7;

//=>
//Dicke Knopf aussen innen oben
dkaio=kaaw-kiaw;
//Dicke (Thickness) Blende
tb=(kias+dkaio)-kaab;

module blende()
{
    cylinder(h=tb,d=db);
}

//Knopfhoehe Unten
khu=kaab-kho;

module knopf_unten()
{
    translate([0,0,tb])
    cylinder(h=khu,d=dkau);
}

module knopf_oben()
{
    translate([0,0,tb+khu])
    cylinder(h=kho,d=dkao);
}

module knopf_massiv()
{
    blende();
    knopf_unten();
    knopf_oben();
}

module knopf_innen()
{
    hki=tb+khu+kho - dkaio;
    cylinder(h=hki,d=dki);
}

difference()
{
    knopf_massiv();
    knopf_innen();
}
