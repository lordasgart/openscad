//Spare1
l1 = 0.3; //Layer1
l2 = 2.8; //Layer2

a=4.0;
b=17;
c=20;
d=4.5;

e=7.5;
f=12;
g=16.5;
l=4.75;
m=12.75;

module plate()
{
    translate([0,0,l2])
    {
        cube([a,g,l1]);
        cube([c,g-e,l1]);
    }
}


module brokenpart()
{
    color("red")
    linear_extrude(l2)
    polygon(points=[[a,g],[0-d,g-l],[0-d+4,g-l-4],[0-d+7,g-l-6],[0-d+m,g-f],[b-3.5,g-f+2],[b,g-e],[a,g-e]]);
}

brokenpart();
plate();