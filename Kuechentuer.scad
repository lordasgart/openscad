//-------------------------
//Kuechentuer
//-------------------------

include <BOSL2/std.scad>

//-------------------------
//Breite Türrahmen
btr=50.4;

//-------------------------
//Tiefe Türrahmen
ttr=13;

//-------------------------
//Tiefe Türangel
tta=19;

//-------------------------
//Höhe Türangel
hta=65;

//-------------------------
//Thickness
t=2.4;

//Breite Blende
bb=t+btr+t;
//Höhe Blende
hb=t+hta+t;
//Tiefe Blende
tb=t+tta+ttr;

difference()
{
//cube([bb,tb,hb]);
cuboid([bb,tb,hb], chamfer=t, anchor=FRONT+LEFT+BOT);

//Cube um Türrahmen auszusparen
translate([t,t+tta,0])
cuboid([btr,ttr,hb], anchor=FRONT+LEFT+BOT);
    
    //Cube um Inneres auszusparen
translate([t,t,t])
cube([btr,tta,hta]);
}

