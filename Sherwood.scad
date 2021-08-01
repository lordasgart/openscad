tlr=2.2;
tou=3.1;
width=439.5;
height=115.5;
depth=20.1;

cube([width,tou,depth]);

cube([tlr,height,depth]);

translate([0,height-tou,0])
cube([width,tou,depth]);

translate([width-tlr,0,0])
cube([tlr,height,depth]);
