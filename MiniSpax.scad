//Höhe Spax-Schraubenkopf
sk=1.7;
//Spax oben
so=5.0;
//Spax Durchmesser Gewinde
sd=3.0;
//Spax Höhe Gewinde
shg=10;
//Schraubenzieher-Zusatz, damit man oben bequem hinkommt, In der Mitte Loch und links rechts nochmal so viel Platz wie das Gewinde
sz=so+sd*2;

//Thickness
t=2.96;//1.7+1.1;//=2.8 ==> recommended from slicer 2.96

module spax()
{    
    color("silver")
        {        
        cylinder(h=t,d1=so,d2=sd);
        
        translate([0,0,0])
        cylinder(h=shg,d1=sd,d2=sd);
        }
}
