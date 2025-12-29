//GamingErhoehung
a=18;
b=36;

h=3.6;
ha=h*2;

t=1.6;
to=0.8;


cube([b+to,a+to,h]);

translate([-t,0,0])
cube([t,a+to,h+ha]);

translate([b+to,0,0])
cube([t,a+to,h+ha]);

translate([-t,-t,0])
cube([b+to+t+t,t,h+ha]);

//translate([-t,a+to,0])
//orcacube([b+to+t+t,t,h+ha]);