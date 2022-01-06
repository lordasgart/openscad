$fn=36;

//Wall Thickness
wt=2.54; //6 lines

//Durchmesser außen 19
da=25.5; //22*1,08*1.08
//Durchmesser innen
di=18; //17 orig
//Länge Stange
ls=640;
//Cube
c=da+wt*2;
//breite regal
br=98;
//breite brett
bb=9;
//tiefe regal
tr=54.5;
//tiefe brett
tb=2;
//kugellager außen 8/22
dka=22;
//kugellager innen
dki=8;
//Radius Filamentrolle 11cm d=22cm
rf=110;
//Metallschiene 6 Lochdurchmesser 25,5 breit
mld=6;
//Metallschiene Breite
msb=25.5;

module stange()
{
    translate([wt,c/2,c/2])
    rotate([0,90,0])
    cylinder(h=ls,d=da);
}

//stange();

module holder()
{
    cube([c,c,c]);
}

//holder();

module cubestange()
{
    translate([wt,wt,wt+da/2])
    color("#FF0000")
    cube([ls,da,da]);
}

//cubestange();

module cutholder()
{
    difference()
    {        
        holder();
        
        cubestange();
        stange();
    }
}

//cutholder();

module downstange()
{
    translate([-c/2+wt,0,0])
    cube([c/2,c,rf+c]);
}

//downstange();

module connector()
{
    translate([0,0,rf+c/2])
    cube([c*2,c,c/2]);
}

//connector();

module metallconnectorraw()
{
    translate([0,0,-c])
    cube([wt,c,c]);
}

//metallconnectorraw();

module loch()
{
    translate([0,c/2,-c/2])
    rotate([0,90,0])
    color("#FF00FF")
    cylinder(h=wt,d=mld);
}

//loch();

module metallconnector()
{
    difference()
    {
        metallconnectorraw();
        loch();
    }
}

//metallconnector();

module bearrollingadapter()
{
    hkl=6.5;
    cylinder(h=hkl,d=dki);
    
    tir=0.6;
    dir=10.5;
    
    translate([0,0,hkl])
    cylinder(h=tir,d=dir);
    
    translate([0,0,hkl+tir])
    cylinder(h=hkl,d1=di,d2=16.5);
}

bearrollingadapter();