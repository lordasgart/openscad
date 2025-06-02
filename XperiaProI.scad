module xperiaproi() {
    
}

$fn=36;

// 166 (ok) x 72 (ok) x 8.9 (aber eher 9.3 in echt + 1.8 bis 2 mm Kamera)

// Parameters
size = [50, 30]; // Width and height of the rectangle
radius = 5; // Radius of the rounded corners

// Create the rounded rectangle
module rounded_rectangle(size, radius) {
    hull() {
        // Bottom-left corner
        translate([radius, radius]) circle(r = radius);
        // Bottom-right corner
        translate([size[0] - radius, radius]) circle(r = radius);
        // Top-right corner
        translate([size[0] - radius, size[1] - radius]) circle(r = radius);
        // Top-left corner
        translate([radius, size[1] - radius]) circle(r = radius);
    }
    // Fill the rectangle in the middle
    translate([radius, radius]) square([size[0] - 2*radius, size[1] - 2*radius]);
}

// Example usage
rounded_rectangle(size, radius);


// Create the rounded cube
module rounded_cube(size, radius) {
    // Hull the corners
    hull() {
        // Bottom corners
        translate([radius, radius, radius]) sphere(r = radius);
        translate([size - radius, radius, radius]) sphere(r = radius);
        translate([size - radius, size - radius, radius]) sphere(r = radius);
        translate([radius, size - radius, radius]) sphere(r = radius);
        // Top corners
        translate([radius, radius, size - radius]) sphere(r = radius);
        translate([size - radius, radius, size - radius]) sphere(r = radius);
        translate([size - radius, size - radius, size - radius]) sphere(r = radius);
        translate([radius, size - radius, size - radius]) sphere(r = radius);
    }
    // Fill the cube in the middle
    translate([radius, radius, radius]) cube([size - 2*radius, size - 2*radius, size - 2*radius]);
}

{
        
    // Example usage
 //   rounded_cube(50, 5);
}