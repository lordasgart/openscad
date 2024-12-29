// Parameters
width = 60;  // Width of the cube
height = 40; // Height of the cube
length = 30; // Length of the cube
radius = 5;  // Radius of the rounded edges

$fn=72;

// Create the rounded cuboid
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

// Example usage
rounded_cuboid(width, height, length, radius);
