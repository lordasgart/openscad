//Bitloeser 
$fn=90;
//Tickness
t=10;
//Durchmesser oben
do=12.5;
//Durchmesser unten
du=11;
//Länge unten
lu=9.25;
//Länge total
lt=25;
//Länge Bit
lb=25;
//Durchmesser innen
di=8;

//Länge oben
lo=lt-lu;

//Scale
s=2.0;

module bitholder() {
    translate([0,0,lu])
    cylinder(h=lo, d=do);
    cylinder(h=lu, d=du);
}

module bitholder_out() {
    translate([0,0,lu])
    cylinder(h=lo, d=do);
    cylinder(h=lu, d2=do,d1=du);
}

module bitloeser() {
    difference() {
        scale([s,s,1])
        bitholder_out();
        bitholder();
    }
}

module bitholder_withhole() {
    difference() {
        bitholder();
        cylinder(h=lt, d=di);
    }
}


bitloeser();
rotate([180,0,0])
bitloeser();
