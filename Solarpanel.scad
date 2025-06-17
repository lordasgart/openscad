//Solarpanel
$fn=70;
//Breite
b=1765;
//Höhe
h=1038;
//Tiefe
d=35.25;
//Breite Panelrand
br=11.5;
//Höhe Panelrand
hr=8.2;
//Tiefe Panelrand
tr=2.55;
//Breite Rand zu Solarzellen (max!)
bs=4.0;

bi=b-br*2;
hi=h-hr*2;

bz=bi-bs*2;
hz=hi-bs*2;

module panel_full() {
    color("#444444")
    cube([b,d,h]);
}

module panel_space_front() {
    color("#BBBBBB")
    translate([br,0,hr])
    cube([bi,tr,hi]);
}

module panel_space_solarcells() {
    translate([br+bs,0,hr+bs])
    cube([bz,tr,hz]);
}

difference() {
    panel_full();
    panel_space_front();
    panel_space_solarcells();
}