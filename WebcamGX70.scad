/* Tab Variables */
fn = 36;
$fn = fn;
//thickness
t = 0.3+0.2*5;

//abstand oben breite
wo = 40; //c in diagram
c = wo;
//unten
wu = 37.0; //a in dia
a = wu;
//abstand oben unten ecken
aou = 8.6;
b = aou;
//aou mitte
aoum = 12.8;
e = aoum;
//d
d = (c-a)/2;
f = sqrt(b*b-d*d);
//u
u = 18.7;
//v
v = a/2;
//w
w=sqrt(u*u-v*v);
//x
x = e-w-f;
//y
y = c/2;
//z
z=sqrt(x*x+y*y);

echo(f);
echo(w);
echo(v);

module half()
{
rotate([0,180,0])
square([v ,f]);
polygon([[0,0],[0,-w],[-v,0]]);
polygon([[-v,0],[-y,f],[-v,f]]);
polygon([[-y,f],[0,f],[0,e-w]]);
}
linear_extrude(height=t)
{
half();
rotate([0,180,0])
half();
}

