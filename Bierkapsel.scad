$fn=72;

f=0.42*7;
d=28.25+f;
h=d/8;

difference(){
cylinder(h=h, d=d+f);
    
    
   translate([0,0,0]);
    cylinder(h=h-0.15*14, d=d);
    
}