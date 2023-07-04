//SpaltBueroWand.scad
s1a=5.1; //spalt-w1-anfang: 5.1
s1e=4.87;//spalt-w1-ende: 4.87

s1m=(s1a+s1e)/2; //Mitte

//s=s1e;
s=s1m; // S1M war zu dünn und hat für S2A gepasst

// => Was ist die Differenz von S1M zu S2A?

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
vc=(d-s1a)/2;

cube([w, d, tz]);

x=(d-s)/2;

module clip()
{
translate([0,x,0])
cube([w, t, vc+tz]);
translate([0,d-t-x,0])
cube([w, t, vc+tz]);
}

clip();
