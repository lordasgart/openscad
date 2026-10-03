// RunderDeckel

/* [Dimensions] */

// Outer diameter of base plate
d2 = 85; // [40:200]

// Diameter of top cylinder
d1 = 75; // [30:190]

// Height of each layer
h = 2.4; // [0.5:0.1:20]

// Edge rounding radius
r = 0.5; // [0.1:0.1:5]

/* [Quality] */

// Render resolution (keep low for preview, increase for final export)
$fn = 32; // [8:8:180]


// Base plate — all edges rounded, bounding box preserved
translate([0,0,r])
minkowski() {
  cylinder(h=h-r*2, d=d2-r*2);
  sphere(r=r);
}

// Top cylinder — only top outer edge rounded
translate([0,0,h])
union() {
  cylinder(h=h-r, d=d1);
  translate([0,0,h-r])
  rotate_extrude()
    union() {
      square([d1/2-r, r]);
      translate([d1/2-r, 0])
        intersection() {
          square([r, r]);
          circle(r=r);
        }
    }
}
