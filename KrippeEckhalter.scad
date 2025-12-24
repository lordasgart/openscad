//KrippeEckhalter
a=9; //18;
b=36;

t=1.0;
to=1.0;

module seite()
{
    //Seite so hoch wie Latte, so breit wie Latte, dick wie t
    cube([b,t,a]);
}

module seite2()
{
    translate([0,b+t+to,0])
    seite();
}

module seite3()
{
    cube([t,b,a]);
}

module seite4()
{
    translate([b+b+t+to,b+t+t+to,0])
    seite3();
}

seite();
//Unterteil Ecke Verlängerung 1 mit 2xt + Toleranz
cube([b,b+t+t+to,t]);
seite2();

translate([b,b+t+t+to,0])
seite3();

translate([b,b+t+t+to,0])
cube([b+t+t+to,b,t]);

seite4();

translate([b,0,0])
cube([b+t+t+to,b+t+t+to,t]);

color("green")
translate([b,b+t+to,0])
cube([t,t,a]);