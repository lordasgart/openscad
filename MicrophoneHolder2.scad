//90mm hoch //37mm durchmesser //32mm 18mm

accuracy_level = 256;

foot_height = 10;

outer_diameter1 = 45;
outer_diameter2 = 40;

height = 70;

rotation = 40;

holm_diameter = 14;

micro_length = 25;
micro_smalldia = 31;
micro_thickdia = 37;

connector_width = 5;
connector_height = 10;

module footer()
{
    cylinder(h=foot_height,d1=outer_diameter1,d2=outer_diameter2,center=false, $fn=accuracy_level);
}

//Holm quadrat
module holm_neu()
{
    translate([-holm_diameter/2,-holm_diameter/2,foot_height])
    color("red")
    cube([holm_diameter,holm_diameter,height-foot_height]);
}

//Holm 
module holm()
{
    translate([0,0,foot_height])
    color("red")
    cylinder(h=height-foot_height,d1=holm_diameter,d2=holm_diameter,center=false, $fn=accuracy_level);
}

module holderstandconnector()
{
    translate([0,0,height])
    color("blue")
    cylinder(h=12.8,d1=holm_diameter,d2=holm_diameter,center=false, $fn=accuracy_level);
}

module holder()
{
    translate([-20.8,0,height+18])
    rotate([0,rotation,0])
    cylinder(h=18.7,d1=outer_diameter2,d2=outer_diameter1,center=false, $fn=accuracy_level);
}

module holder_top_cutout()
{
    color("pink")
    translate([-25,0,100])
    rotate([0,rotation,0])
    cube([29,29,29], center = true);
}

module holderloch()
{
    translate([-24,-0,height+14])
    rotate([0,rotation,0])
    {
        color("green")
        cylinder(h=micro_length,d1=micro_smalldia,d2=micro_thickdia,center=false, $fn=accuracy_level);
    }
}

module holderhull()
{
    hull()
    {
      holder();
      holderstandconnector();      
    }
}

module top()
{
    difference()
    {
        holderhull();
        holderloch();
        
        holder_top_cutout();
    }
    //holder_top_cutout();
    //holderloch();
}

module connector()
{
    color("gray")
    cube([connector_width,connector_width,connector_height], center = true);
}

module connector_bottom()
{    
    translate([0,0,foot_height])
    connector();
}

module footer_with_connector_hole()
{
    difference()
    {
        footer();
        connector_bottom();
    }
}

module connector_top()
{    
    translate([0,0,height])
    connector();
}

module holm_with_connector_holes()
{
    difference()
    {
        holm_neu();
        connector_bottom();
        connector_top();
    }
}

module top_with_connector_hole()
{
    difference()
    {
        top();
        connector_top();
    }
}

//footer_with_connector_hole();
connector_bottom();
holm_with_connector_holes();
connector_top();
//top_with_connector_hole();
    