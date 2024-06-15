width=20;
height=140;
t=2;


cube([width, t, 140]);

translate([width-t,0,0])
cube([t, width, 140]);
