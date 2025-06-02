/*
---
Description: Creates a rounded cuboid.
Parameters:
  width: Width of the cube
  height: Height of the cube
  lenght: Length of the cube
  radius: Radius of the rounded edges
Include: include <includes/rounded.scad>
Examples: |
  rounded_cuboid(60, 40, 30, 5); # A rounded cube with size 60 x 40 x 30 and rounded edges with a radius of 5
---
*/
module rounded_cuboid(width, height, length, radius) {
    hull() {
        // Bottom corners
        translate([radius, radius, radius]) sphere(r = radius);
        translate([width - radius, radius, radius]) sphere(r = radius);
        translate([width - radius, height - radius, radius]) sphere(r = radius);
        translate([radius, height - radius, radius]) sphere(r = radius);
        // Top corners
        translate([radius, radius, length - radius]) sphere(r = radius);
        translate([width - radius, radius, length - radius]) sphere(r = radius);
        translate([width - radius, height - radius, length - radius]) sphere(r = radius);
        translate([radius, height - radius, length - radius]) sphere(r = radius);
    }
    // Fill the cuboid in the middle
    translate([radius, radius, radius]) cube([width - 2*radius, height - 2*radius, length - 2*radius]);
}
