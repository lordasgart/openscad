$fn=36;
innerwidth = 86;
innerdepth = 33;
frontwallwitdh=14;
height=128;
t=4;

module mainunitholder()
{
    difference()
    {
        cube([innerwidth+t+t, innerdepth+t+t, height+t]);   
        
        translate([t,t,t])
        cube([innerwidth, innerdepth, height]);
        
        translate([frontwallwitdh,0,0])
        cube([innerwidth+t+t-frontwallwitdh*2, t, height+t]);
    }
}

difference()
{
    //mainunitholder();
    schraube();
}

//Höhe Schraubenkopf
hsk=2;
//Durchmesser Schraubenkopf
dsk=3;
//Durchmesser Schraube
ds=1.5;
//Höhe Schrauben(gewinde)
hs=10;

module schraube()
{
    translate([0,hsk,0])
    rotate([90,0,0])
    {
        cylinder(h=hsk,d=ds, d2=dsk);
        translate([0,0,-hs])
        cylinder(h=hs,d=ds);
    }
}