$fn=36;
//Durchmesser Beilagscheibe groß
dmbg=16;
a=64;
b=51;
c=39;
d=10;
e=5;
i=(a-b)/2;
//Durchmesser Loch Breite Solarpanel
k=(b-c)/2;
m=i+k/2;
h=d*2;
t=5;
//Dicke Verstaerkung
tv=2;

   
//    translate([(a-b)/2,0,0])
//    translate([e/2,h/2,0])
//    cylinder(h=t, d=e);
    
//    translate([-(a-b)/2,0,0])
//    translate([a-e/2,h/2,0])
//    cylinder(h=t, d=f);


module lochanlage()
{
    s=1;
    color("green")
    scale([s,s,s])
    {
        cylinder(h=tv, d1=k, d2=k*0.9);
    }
}

module verbindermitanlagenlochverstaerkung()
{
    cube([a,h,t]);
    
    translate([m,h/2,t])
    lochanlage();
    
    translate([a-m,h/2,t])
    lochanlage();
}

difference() {
    verbindermitanlagenlochverstaerkung();
    
    translate([m,h/2,0])
    cylinder(h=t+tv, d=e);
    
    translate([a-m,h/2,0])
    cylinder(h=t+tv, d=e);
}
