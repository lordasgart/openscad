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
}