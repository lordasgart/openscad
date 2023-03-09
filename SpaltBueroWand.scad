//SpaltBueroWand.scad
s1a=5.1; //spalt-w1-anfang: 5.1
s1e=4.87;//spalt-w1-ende: 4.87

s=s1e;

h=5; //feste hoehe für alle stücke

d=h*2;

t=0.86;
tz=0.3+0.2+0.2+0.2; //0.9

w1=380; //Wandteil 1
w2=700; //2
w3=390; //3

w=127; //Länge der einzelnen Stücke

//Abstand Clip
ac=s-t;

//Versatz Clip
vc=(d-s)/2;

cube([w, d, tz]);

module clip()
{
cube([w, t, vc+tz]);
translate([0,ac,0])
cube([w, t, vc+tz]);
}

translate([0,vc,0])
clip();