//Hakenamellenzaun
/*
t=3;

//oben
cube([t*3,t,t]);
//rechts hinten
translate([t*2,0,-t*2])
cube([t,t,t*2]);
//mitte
translate([0,0,-t*4])
cube([t,t,t*4]);
//unten
translate([-t*2,0,-t*5])
cube([t*3,t,t]);
//links vorne
translate([-t*2,0,-t*4])
cube([t,t,t*2]);
*/

t = 5.5;
r = 0.3; // Radius der Rundung

//t = 2.4;
//r = 0.3; // Radius der Rundung

module lamellenzaun() {
    union() {
        // oben
        cube([t*3, t, t]);
        
        // rechts hinten
        translate([t*2, 0, -t*2])
        cube([t, t, t*2]);
        
        // mitte
        translate([0, 0, -t*4])
        cube([t, t, t*4]);
        
        // unten
        translate([-t*2, 0, -t*5])
        cube([t*3, t, t]);
        
        // links vorne
        translate([-t*2, 0, -t*4])
        cube([t, t, t*2]);
    }
}

$fn=36;

 () {
    lamellenzaun();
    sphere(r);
}
