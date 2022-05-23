$fn=36;

//Durchmesser Plastik LED
d=8.36;

//3 Linien nach Perimeters.xlsx
c=9.67;



difference()
{
cube(c);


xy = (c-d)/2;

translate([xy+d/2,xy+d/2,0])
cylinder(h=d, d=d);
}