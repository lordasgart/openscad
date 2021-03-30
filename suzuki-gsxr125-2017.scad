$fn=72;

/* [Sichtbarkeit] */
//Prägung anzeigen
show_embossing = true;

/* [Allgemein] */

//durchmesser aufhänger schlüsselbrett ist 1cm 
d1 = 11.6;
//länge innenteil
l = 43;
//breite innenteil
b = 25;
//dickste stelle original 8 dünnste 6
h_keyholder = 6;
//the same as h_keyholder
h = h_keyholder;
//tiefe der prägung
emboss_d = 0.8;
//schriftart
font1 = "Liberation Sans";//"Liberation Sans:style=Bold"
//length textblock
lt = 7;
//case thickness
ct = 2.5;
//total case width
tcw = b+ct*2;
//70,35,15

//----------------------
// Module
//----------------------

module bikepart()
{
  color("#790000")
  translate([l/2,b/2,h/2])
  resize(newsize=[l,b,h_keyholder])
  difference()
  {
    cube([260,150,h_keyholder], center=true);

    if (show_embossing)
    {      
      translate([0,0,h_keyholder/2-emboss_d])
      linear_extrude(height = emboss_d)
      import("/home/lordasgart/Nextcloud/Pictures/SVG/suzuki-gsxr125-2017b-simplify1.svg", center = true);
    }
  }
}

module textblock()
{
  translate([l,0,0])
  difference()
  {
    cube([lt,b,h_keyholder]);
    
    translate([5,1.8,0])
    rotate([0,0,90])
    translate([0,0,h_keyholder-emboss_d])
    linear_extrude(height = emboss_d) {
      text("GSX-R125", font = font1, size = 3, spacing = 1.1);
    }
  }
}

module case()
{
  color("blue")
  translate([0,-ct,0])
  cube([l+lt,ct,h]);

  color("blue")
  translate([0,b,0])
  cube([l+lt,ct,h]);

  color("blue")
  translate([-ct,-ct,0])
  cube([ct,b+ct+ct,h]);

  //color("blue")
  //translate([l+lt,-ct,0])
  //cube([ct,b+ct+ct,h]);
  
  color("blue")
  translate([l+lt,0,0])
  cube([ct,b,h]);
  
  color("pink")
  translate([l+lt,0,0])
  linear_extrude(height = h)
  circle(d=ct*2);
  
  color("pink")
  translate([l+lt,b,0])
  linear_extrude(height = h)
  circle(d=ct*2);
}

module top()
{
  difference()
  {
    translate([-ct,b/2,0])
    linear_extrude(height = h)
    circle(d=tcw);

    color("green")
    translate([-ct,-ct,0])
    cube([tcw,tcw,h]);
    
    translate([-tcw/2+d1/2-ct+3.4,b/2,0])
    linear_extrude(height = h)
    circle(d=d1);
  }
}

//----------------------
// Rendering
//----------------------

bikepart();
textblock();
case();
top();
