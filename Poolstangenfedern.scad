/*poolstangenfedern*/
//schmaler => bdu
//feder nach unten kleiner => ab verändern

$fn=72;

//Stange
sda = 16.3;// aussendurchmesser
sdi = 14.7;// innen
//Loch
ld = 6.3;// durchmesser loch
a = 3.5;// abstand 3.5 vom rohrende

//Böbbl
bd = 5.2;//durchmesser böbel teil orig 5.3
bdu = 8.4;//durchmesser von der Platte unter dem Böbel orig 8.8
bud = 1.7;// dicker t vom böbel platte unten
t = bud;
tbh = 7.0;//total böbel height 7.0
f = 22;//Federlänge von zentrum böbel bis zur unteren biegung

h1 = tbh - bud; //höhe oberer böbelteil = gesamt - dicke platte
hc = h1 - bd/2; //höhe cylinder den wir an die kugel kleben müssen um h1 zu erreichen

sh = 40; //stangenhöhe geschätzt
ab = 13.2; //orig. 13.5 durch ausprobieren mit teststange

module boebel()
{
    color("white")
    {
        sphere(d=bd);
    
        //die 1 ist wegen dem leeren layer im prucaslicer
        translate([0,0,-bd/2-1]) //um den radius nach unten verschieben zum dran kleben
        cylinder(h=hc+1,d1=bd,d2=bd);

        //platte böbel
        translate([0,0,-hc-bud])
        cylinder(h=bud,d1=bdu,d2=bdu);
    }
}

module loch()
{
    color("yellow")
    translate([0,-2,sh-ld/2-a])
    rotate([90,0,0])
    cylinder(h=sdi/2,d1=ld,d2=ld);
}

module stange()
{
    color("gray")
    difference()
    {
        cylinder(h=sh,d1=sda,d2=sda);
        cylinder(h=sh,d1=sdi,d2=sdi);
        loch();
    }
}

module teststange()
{
    translate([0,-sh+a+ld/2,-8.5])
    rotate([270,0,0])
    stange();
}


boebel();
//teststange();

m = (-hc-bud/2-ab)/2;
da = ab+t-hc-bud/2;
di = da-t*2;

//feder oben
color("white")
translate([0,(f-da/2)/2,-hc-bud/2])
cube([bdu,f-da/2,t], center=true);

//feder unten
color("white")
translate([0,(f-da/2)/2,-ab])
cube([bdu,f-da/2,t], center=true);

difference()
{
//cylinder for feder
translate([-bdu/2,f-da/2,m])
rotate([0,90,0])
cylinder(h=bdu,d1=da,d2=da);

//cylinder to cut feder
color("green")
translate([-bdu/2,f-da/2,m])
rotate([0,90,0])
cylinder(h=bdu,d1=di,d2=di);

//cube to cut feder
translate([0,(f-da/2)/2,-hc-bud-di/2])
cube([bdu,f-da/2,di], center=true);
}

//platte böbel für feder unten
        translate([0,0,-ab-bud/2])
        cylinder(h=bud,d1=bdu,d2=bdu);
