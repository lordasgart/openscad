$fn=72;

//Durchmesser Plastik LED
d=8.36+0.42*3;

//3 Linien nach Perimeters.xlsx
c=11.4+0.42*3;//10.93;


xy = (c-d)/2;

module corpus()
{
    
    translate([xy+d/2,xy+d/2,3.2])
sphere(d=c);
    
    translate([xy+d/2,xy+d/2,6.4])
    cylinder(h=1,d=d+0.42*3);
    
}

difference()
{
corpus();

translate([xy+d/2,xy+d/2,4])
sphere(d=d);

translate([xy+d/2,xy+d/2,3.8])
cylinder(h=d, d=d);
}

