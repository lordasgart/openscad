//SchreibtischLeisteUnten

d=17.4;
l=190;

hbr=2000;
hbl=12;

t=2.0;

module brett()
{
    translate([0,t,t])
    cube([l, d, hbr]);
}

module blende()
{
    translate([0,0,0])
    cube([l+t, d+t+t, hbl]);
}

difference()
{
    blende();
    brett();
}