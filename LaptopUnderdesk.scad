$fn=36;

//Dicke der Elemente
t=3.79;
//Dicker des unteren Brettes + Toleranz
b=16.5+1;
//Tiefe
d=t*3;
//Höhe Bottom Connector
hbc=t*4;
//Kabelabstand
ka=t+0.42*10; //=7.99
//Tiefe Brett
tb=260;
//Tiefe Connector oben
tco=tb/3; //ca. 90 nach hinten gemessen
//Total bottom connector width
tbcw=t+b+t;

//Unterer Verbinder (eine Wand)
module connectorwallbottom()
{
    cube([t,d,hbc]);
}

connectorwallbottom();

translate([t+b,0,0])
connectorwallbottom();

color("red")
translate([0,0,hbc])
cube([tbcw,d,ka]);

translate([-tco/2+tbcw/2,0,hbc+ka])
cube([tco,d,t]);