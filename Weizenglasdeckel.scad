// Weizenglasdeckel

$fn=180;

d1=75;
d2=85;
r=0.5;

minkowski() {
  cylinder(h=2.4-r*2, d=d2-r*2);
  sphere(r=r);
}
translate([0,0,2.4])
union() {
  cylinder(h=2.4-r, d=d1);
  translate([0,0,2.4-r])
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
