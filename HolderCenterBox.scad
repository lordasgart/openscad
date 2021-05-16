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

connector_holzplatte();

translate([-bc/2,-bc/2,-tc/2])
spax();
