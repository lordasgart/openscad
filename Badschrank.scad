// Badschrank cylinders
// d1=5, l1=8.5 (top/small), d2=6.8, l2=10.4 (bottom/large)

d1 = 5;
d2 = 6.8;
l1 = 8.5;
l2 = 10.4;

// Large cylinder on bottom
cylinder(h = l2, d = d2, center = false, $fn = 64);

// Small cylinder on top
translate([0, 0, l2])
    cylinder(h = l1, d = d1, center = false, $fn = 64);
