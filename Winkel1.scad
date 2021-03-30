
translate([0.25,0,0.25])
rotate(a=[0,45,0])
import("C:/Users/lordasgart/Desktop/90degree_Bracket_chamfer.stl");

translate([32,17,0])
cube([15,15,8]);
translate([32,-31,0])
cube([15,15,8]);

translate([0,17,34])
cube([8,15,15]);

translate([0,-31,34])
cube([8,15,15]);