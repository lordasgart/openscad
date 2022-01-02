$fn=36;

//Durchmesser außen
da=19;
//Durchmesser innen
di=17;

module stange()
{
    rotate([0,90,0])
    cylinder(h=100,d=da);
}

stange();