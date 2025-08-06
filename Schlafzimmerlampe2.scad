$fn=360;

module rounded_cylinder_manual(h=20, d1=65, d2=69, fillet=2) {
    minkowski() {
        cylinder(h=h - 2*fillet, d1=d1, d2=d2);
        sphere(r=fillet);
    }
}

module kabel() {
    color("blue")
    translate([0,-2.5,-2])
    cube([5,69,20]);
}

module cylinder_cut() {
    color("red")
    scale([0.9,0.9,0.9])
    translate([0,0,-2])
    rounded_cylinder_manual();
}

difference() {
rounded_cylinder_manual();
kabel();
cylinder_cut();
}