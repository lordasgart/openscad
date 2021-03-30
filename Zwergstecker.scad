//Abstand linker zu rechter Rand der beiden Zwergstecker
a=10.6;
//Durchmesser Zwerstecker
d=2.6;
//Breite Zwergsteckerleiste
b=18;
//Tiefe Stecker
t=8;
//nageldurchmesser
nd=2;
//Nagellänge Total
nlt=24.6;
//Durchmesser Nagelkopf
dnk=4*1.5;
//Höhe Nagelkopf
hnk=1.8*4;
//Höhe wenn eingesteckt bis unter Nagelkopf
he=19.2;
//Tiefe eingesteckt (das nehmen wir eben oben am Stecker auch als Länge für den Kabelkanal 
te=nlt-he;
//Abstand Rand Loch von Rand Stecker
r=(b-a)/2;
//Und nun noch mit Versatz des Radius des Zwergensteckers
v=r+(d/2);

$fn=16;

module nagel_i()
{
cylinder(h = nlt-hnk, d=nd);
translate([0,0,nlt-hnk])
cylinder(h = hnk, d = dnk);
}
module nagel()
{
    color("#555555")
    nagel_i();
}


module zwerkstecker()
{
    color("orange")
    cylinder(h = nlt, d=d);
}

module metallstift()
{
    color("orange")
    cylinder(h = nlt, d=nd);
}

module nagelstecker()
{
    nagel();
translate([0,0,te+hnk])
//zwerkstecker();
metallstift();
    
    
}

//-(d-nd)/2 => da die metallstifte dünner sind, als die zwergstecker, bringe ich diese ganz nach außen, damit sie da Kontakt haben

module steckerlinks()
{

    translate([t/2,v-(d-nd)/2,0])
nagelstecker();
}

module steckerrechts()
{
translate([t/2,b-v+(d-nd)/2,0])
nagelstecker();
}

module gehaeuse()
{
translate([0,0,te])
cube([t,b,he+hnk+te]);
}

module stecker()
{
difference()
{
    gehaeuse();
    steckerlinks();
    steckerrechts();
}
}

module fertig()
{
difference()
{
    stecker();
    translate([t/2,0,0])
    gehaeuse();
}
}

//nagelstecker();
fertig();













