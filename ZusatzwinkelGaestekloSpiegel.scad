// Zusatzwinkel Gästeklo Spiegel
// ZusatzwinkelGaestekloSpiegel.scad

// a) Haben wir noch so ein Klebeband?
// Nein
// => Bestellen

to=2;
t=2.4;

klebeband = 25+to*2;
k=klebeband;
w = 100;

module wandseite()
{
    translate([0,k,0])
    rotate([90,0,0])
    regalseite();
}

module regalseite()
{
    cube([w,k,t]);
}

module poly()
{
    rotate([90,0,90])
    linear_extrude(t)
    polygon([[0,t],[k-t,t],[k-t,k]]);
}

module poly2()
{
    translate([w-t,0,0])
    poly();
}

wandseite();
regalseite();
poly();
poly2();
