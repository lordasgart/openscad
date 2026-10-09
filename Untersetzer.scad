// Untersetzer

/* [Dimensions] */

// Outer diameter of base plate
d2 = 90; // [40:200]

// Height of base plate
h = 2.4; // [0.5:0.1:20]

// Edge rounding radius (capped at h/2)
r = 1.0; // [0.1:0.1:5]

/* [Quality] */

// Render resolution (keep low for preview, increase for final export)
$fn = 32; // [8:8:180]


rr = min(r, h/2);

// Base plate — all edges rounded, bounding box preserved
translate([0,0,rr])
minkowski() {
  cylinder(h=h-rr*2, d=d2-rr*2);
  sphere(r=rr);
}
