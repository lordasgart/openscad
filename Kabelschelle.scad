//Kabelschelle

include <Schraube.scad>

$fn=36;

//USB
usb=4;
//LAN
lan=6;

d=lan;

t=2.5;

s=0.7;
montageband=28;

/*
difference()
{
    cylinder(h=d*3, d=d+t*2);
    cylinder(h=d*3, d=d);
    
    translate([-(d+t*2)/2,0,0])
    cube([d+t*2,d+t*2,d*3]);
}
*/

kabellaenge=d*16;

module kabel()
{
    color("gray")
    translate([0,0,-d*3])
    cylinder(h=kabellaenge, d=d);
}

//schellenbreite_kabel=d*2;
schellenbreite_kabel=montageband;
schellendicke_kabel=d*2;

module part_a()
{   
    difference()
    {
        cylinder(h=schellenbreite_kabel, d=schellendicke_kabel);    

        color("orange")
        translate([-d,0,0])
        cube([schellendicke_kabel,d,schellenbreite_kabel]);        
    }
    
    color("orange")
        translate([-d,0,0])
        cube([schellendicke_kabel,d/2,schellenbreite_kabel]);    
}

module schelle_halbkreis()
{   
    difference()
    {
        part_a();
        
        color("red")
        translate([-d/2,0,0])
        cube([d,d,schellenbreite_kabel]);
        
        kabel();
    }    
}

schelle_halbkreis();


/*
difference()
{
    translate([-d*3,0,0])
    color("blue")
    cube([schellendicke_kabel,d/2,schellenbreite_kabel]);    
    
    translate([-d*2,0,schellenbreite_kabel/2])
    rotate([270,0,0])
    scale([s,s,s])
    Schraube();
}
*/

translate([-montageband-d/2,0,0])
color("blue")
cube([montageband,d/2,schellenbreite_kabel]);