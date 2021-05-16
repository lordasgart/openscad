include<MiniSpax.scad>

$fn=36;

//Breite Connector
bc=50;
//Tiefe Connector
tc=4.0;

module schraube()
{
    cylinder(h=hm, d=dm);

    translate([0,0,hm])
    cylinder(h=hb, d=db);

    translate([0,0,hm+hb])
    cylinder(h=lsh, d=ds);
}

module connector_holzplatte()
{
    cube([bc,bc,tc], center=true);
}

module connector_down()
{
    translate([0,0,-61/2-tc/2])
    cube([1,1,61], center=true);
}

module connector_speaker()
{
    rotate([15,0,0])
    translate([0,0,-61-30/2-tc/2])
    cube([30,5,30], center=true);
}

connector_holzplatte();
connector_down();
connector_speaker();

translate([-bc/2,-bc/2,-tc/2])
spax();
schraube();
