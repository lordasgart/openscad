$fn=36;
innerwidth = 84;
innerdepth = 31;
frontwallwitdh=13;
height=128;
t=4;
outerwidth=innerwidth+t+t;

module mainunitholder()
{
    difference()
    {
        cube([outerwidth, innerdepth+t+t, height+t]);   
        
        translate([t,t,t])
        cube([innerwidth, innerdepth, height]);
        
        translate([frontwallwitdh,0,0])
        cube([outerwidth-frontwallwitdh*2, t, height+t]);
    }
}

difference()
{
    mainunitholder();
    
    translate([0,innerdepth+t,0])
    {
        translate([outerwidth/3,0,height/6*5])
        schraube();
        
        translate([outerwidth/3*2,0,height/6*5])
        schraube();
        
        translate([outerwidth/3,0,height/6*4])
        schraube();
        
        translate([outerwidth/3*2,0,height/6*4])
        schraube();
        
        translate([outerwidth/3,0,height/6*3])
        schraube();
        
        translate([outerwidth/3*2,0,height/6*3])
        schraube();
        
        translate([outerwidth/3,0,height/6*2])
        schraube();
        
        translate([outerwidth/3*2,0,height/6*2])
        schraube();
    }
}

//Höhe Schraubenkopf
hst=16.5;
hsk=300;
//Durchmesser Schraubenkopf
dsk=6.75;
//Durchmesser Schraube
ds=1.5;
//Höhe Schrauben(gewinde)
hs=hst-hsk;

module schraube()
{
    translate([0,hsk,0])
    rotate([90,0,0])
    {
        cylinder(h=hsk,d1=ds, d2=dsk);
        translate([0,0,-hs])
        cylinder(h=hs,d=ds);
    }
}