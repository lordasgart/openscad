//Bankerhoehung

//Länge
l=310;
//Breite
b=30;
//Höhe
f=38;

module erhoehung()
{
    cube([l, b, f]);
}

module adapter() {
rl=l*1.04;
rb=b*1.35;
translate([-(rl-l)/2,-(rb-b)/2,f])
resize([rl,rb,f])
erhoehung();
}

module part()
{
hull()
{
    adapter();
    erhoehung();
}
}

difference()
{
    part();
    
    translate([0,0,f])
    erhoehung();    
    
    for( i = [20 : 20 : 140] )
    {
    translate([i, b/2, 0])
    bleistift();
    }
    
    translate([82,0,0])
    cutblock();
}

//durchmesser bleistift
db=8;

$fn=72;

module bleistift()
{
color("lightblue")
cylinder(h=f,d=db);
}

module schraube()
{
    color("orange")
    {
        hk=2;
        h=18;
        cylinder(h=hk, d1=5, d2=2);
        translate([0,0,hk])
        cylinder(h=h, d1=2, d2=1);
    }
}

schraube();

module cutblock()
{
color("blue")
translate([0,0,-f])
adapter();
color("blue")
adapter();
}