d=100;
t=2;
h=d;

kb=25+t; //Klebeband
w=kb*2;
wd=t*2;

module seite()
{
cube([t,w,h]);
}

seite();

module oben()
{
cube([h,w,t]);
}

oben();

module winkel()
{
rotate([270,270,0])
color("yellow")
linear_extrude(wd)
polygon([[0,0],[h,0],[0,h]]);
}

winkel();

translate([0,w-wd,0])
winkel();