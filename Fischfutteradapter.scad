//Fischfutteradapter
$fn=36;
//Spalt
sp=3.5;
//Höhe Rand
hr=18.8;
//Erhöhung
er=hr;
//Höhe Halter
hh=30;
//Breite Halter
bh=50;
//Tiefe Halter
th=15;

module halter()
{
    cube([bh, th, hh]);
}

module randadapter()
{
    difference()
    {
        cube([bh, th, hr]);
        //Schlitz
        translate([0, th/2, ,0])
        cube([bh, sp, hr]);
    }
}

//randadapter();
//translate([0,0,hr])
//halter();

//Verlängerung
cube([bh, th, hh/2]);
