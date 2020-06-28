/* [Platine] */
//platine breite
pl=70.2;
//lochrand zu lochrand länge
pw=30;
//platine länge
la=68;
//lochrand zu lochrand breite
lab=28.3;
//lochdurchmesser
ld=2.2;
//platinendicke
pd=1.6;
//höhe leds mit platinendicke pd
hled=10;
//höhe widerstände mit platinendicke
hw = 5;
//höhe lötzinn mit platinendicke (natürlich von anderer seite)
hz = 6;
//led fläche ca. 25.2 mal 25.2
ledf = 25.2;
//nur die leds (irgendein zylinder mit alutfolie als spiegel :)
ledfi = 18;
//lochdurchmesser schalter
ls = 5; 
//lochdurchmesser buchse
lb = 8;
//schalterbreite max
sbm = 12;
//buchsebreite max
bbm = 12;
//mindesttiefe für schalter und buchse
ts = 25; 
//thickness
t = 1.6;
n = 0.4;
//w = inner width of case
//h = inner height of case
//d = inner depth of case
//t = thickness of walls
module case(w, h, d, t)
{
    //das ganze ein nach links, dann müssen wir bei anderen sachen nicht so viel über die t nachdenken
    translate([-t,0,0])
    {
        backwall(w,t,h,d);
        leftwall(t,d,h);
        rightwall(t,d,h,w);
        bottomwall(w,d,t);
        topwall(w,d,t,h);
    }
}

module backwall(w, t, h, d )
{
    translate([0,d,0])
    cube([w+2*t,t,h]);
}
module leftwall(t, d, h)
{
    cube([t,d,h]);
}
module rightwall(t, d, h, w)
{
    translate([t+w,0,0])
    cube([t,d,h]);
}
module bottomwall(w,d,t)
{
    translate([0,0,-t])
    cube([w+2*t,d+t,t]);
}
module topwall(w,d,t,h)
{
    translate([0,0,h])
    cube([w+2*t,d+t,t]);
}


//pw
//pl
//Die Höhe der LEDs, (mit Platine), die Höhe des Lötzinns, zusätzlicher Puffer)
color("gray")
case(pw,pl,hled+hz+sbm+4,t);

//breite der platine = pw
//hoehe der platine = ph
//dicke der platine = pd
module platinenplatte(pw,ph,pd)
{
    color("green")
    cube([pw,pd,ph]);
}

module leds()
{
   translate([0,-(hled-pd),0])
   cube([ledf,hled,ledf]); 
}

module loetzinn()
{
    leda = (pw-ledf)/2;
    
    translate([leda,pd,leda])
    cube([ledf,hz,pl-leda*2]);
}

module leds_nachtlicht()
{
    leda = (pw-ledf)/2;//abstand der großzügigen led fläche zu den rändern oben
    translate([leda,0,pl-ledf-leda])
    color("#6600FF")
    leds();
}

module platine()
{
    platinenplatte(pw,pl,pd);
    
    //BAUTEIL
    leds_nachtlicht();
    
    loetzinn();
}

platine();