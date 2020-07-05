$fn=36;
/* [Platine] */
//Gehäuse anzeigen
showcase=true;
//Platine anzeigen
showplatine=true;
//platine länge
pl=70.2;
//platine breite
pw=30;
//lochrand zu lochrand länge
la=68;
//lochrand zu lochrand breite
lab=28.3;
//abstand löcher zum platinenrand in der breite
arb=(pw-lab)/2;
//abstand löcher zum platinenrand in der länge
arl=(pl-la)/2;
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
//Toleranz
to = 4;
//schrauben gewinde innen
sgi = 1.5;
//schraubenlänge
sl = 7.0;
/* [Hidden] */
//Lochzentrum Breite = Radius des Loches + Abstand Rand der Breite
lzb = ld/2+arb;
//Dasselbe für Länge
lzl = ld/2+arl;
//Lz ist der kleiner der beiden Werte
lz = lzb<lzl ? lzb : lzl;
//Die Höhe der LEDs, (mit Platine), die Höhe des Lötzinns, zusätzlicher Puffer)
cd = hled+hz+sbm+to;
//hinter der platine (gleich cd?)
cd2 = (hz-pd)+sbm+to;

//w = inner width of case
//h = inner height of case
//d = inner depth of case
//t = thickness of walls
module case(w, h, d, t)
{
    color("gray")
    //das ganze ein nach links, dann müssen wir bei anderen sachen nicht so viel über die t nachdenken, inkl. toleranzen
    translate([-t,0,0])
    {
        backwall(w,t,h,d);
        leftwall(t,d,h);
        rightwall(t,d,h,w);
        bottomwall(w,d,t);
        topwall(w,d,t,h);
    }
    
    translate([pw,0,-t])
    cube([lzb+lz,cd+t,lzl+lz]);
    
    translate([-lzb-lz,0,-t])
    cube([lzb+lz,cd+t,lzl+lz]);
    
    translate([-lzb-lz,0,pl-lzl-lz+t])
    cube([lzb+lz,cd+t,lzl+lz]);
    
    translate([pw,0,pl-lzl-lz+t])
    cube([lzb+lz,cd+t,lzl+lz]);
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
if (showcase)
{
    case(pw,pl,cd,t);
}

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
    if (showplatine)
    {
        platinenplatte(pw,pl,pd);
    }
    translate([0,pd,0])
    cube([lzb+lz,cd2,lzl]);
    translate([0,pd,0])
    cube([lzb,cd2,lzl+lz]);
    
    translate([pw-lzb-lz,pd,0])
    cube([lzb+lz,cd2,lzl]);
    translate([pw-lzb,pd,0])
    cube([lzb,cd2,lzl+lz]);
    
    translate([pw-lzb-lz,pd,pl-lzl])
    cube([lzb+lz,cd2,lzl]);
    translate([pw-lzb,pd,pl-lzl-lz])
    cube([lzb,cd2,lzl+lz]);
    
    translate([0,pd,pl-lzl])
    cube([lzb+lz,cd2,lzl]);
    translate([0,pd,pl-lzl-lz])
    cube([lzb,cd2,lzl+lz]);
       
    translate([lzb,0,lzl])
    {    
        if (showplatine)
        {
            platinenloecher(pd,ld);
        }
        schraubenloecher();
        schraubenhalter();
        //verbinder();        
    }    
    translate([pw-lzb,0,lzl])
    {    
        if (showplatine)
        {
            platinenloecher(pd,ld);
        }
        schraubenloecher();
        schraubenhalter();
    }
    translate([pw-lzb,0,pl-lzl])
    {    
        if (showplatine)
        {
            platinenloecher(pd,ld);
        }
        schraubenloecher();
        schraubenhalter();
    }
    translate([lzb,0,pl-lzl])
    {    
        if (showplatine)
        {
            platinenloecher(pd,ld);
        }
        schraubenloecher();
        schraubenhalter();
    }
    
    if (showplatine)
    {
        //BAUTEIL
        leds_nachtlicht();
    
        loetzinn();
    }
}

//platinendicke
//lochdurchmesser
module platinenloecher(pd,ld)
{
    translate([0,pd,0])
    rotate([90,0,0])
    cylinder(h=pd,d1=ld,d2=ld);
}

module schraubenloecher()
{
    color("green")
    translate([0,sl+pd,0])
    rotate([90,0,0])
    cylinder(h=sl,d1=sgi,d2=sgi);
}

module schraubenhalter()
{
    color("red")
    translate([0,hz+sbm+to,0])
    rotate([90,0,0])
    cylinder(h=cd2,d1=lz*2,d2=lz*2);
}


translate([0,hled,0]) //das ist die platinendicker wieter hinten, und das ist absicht, das ist die toleranz zur front
platine();
