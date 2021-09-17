
$fn=90;
//Breite
a=1.75;
c=1.5;
t=14.3;

//a+b+c+d=8.2;
//Berechnungen siehe S-Note
b=2.85;
d=2.1;

//Durchmesser
da=13.75;
db=9.75;
dc=23;
dd=12;

dre=2.5; //Durchmesser gerundete Ecke

module abasics()
{
cylinder(h=a,d=da);

translate([0,0,a])
cylinder(h=b,d=db);

}

module cplate()
{
    translate([0,0,a+b])
cylinder(h=c,d=dc);
}

abasics();
cplate();
dmiddle();

se=dd/2-dre/2;

module dmiddle()
{
translate([0,0,a+b+c])
scale([1,1,0.25])
minkowski()
{
//translate([0,0,a+b+c])
cube([dd-dre,dd-dre,d], center=true);

//translate([se,se,a+b+c-d/2])
cylinder(h=d,d=dre);
}
}