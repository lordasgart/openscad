//14*11.5

//Dilbert
w=140;
d=115;
t=3.79;
h=22.1;
echo(h);
v=h*2;



//translate([0,0,0])
module 
dilbert() {

cube([w,d,t]);

translate([-t,0,0])
cube([t,d,h]);

translate([w,0,0])
cube([t,d,h]);

translate([-t,-t,0])
cube([w+t+t,t,h]);

translate([-t,d,0])
cube([w+t+t,t,h]);
}

dilbert();

//translate([0,v,h])
//dilbert();