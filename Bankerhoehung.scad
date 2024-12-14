//Bankerhoehung

//Länge
l=310;
//Breite
b=30;
//Höhe
h=38;

module adapter() {
    difference() {
        adapterint();
        erhoehung();
    }
}

module erhoehung()
{
    cube([l, b, h]);
}

module adpaterint()
{
    r=
    resize(
}