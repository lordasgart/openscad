a=102;
b=82;
c=8;
t=1.6;

difference() {
cube([a+t+t,b+t+t,c+t]);
translate([t,t,t])
cube([a,b,c]);
}