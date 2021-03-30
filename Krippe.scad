//Pflock Breite Tiefe
p=8;
//Pflock Höhe
hp=68;
//Latte 600 10 5
lh=10;
//Latte Dicke
ld=5;
//Latte Länge
ll=600;
//Lattenhöhe + Kulanz für Abstand
lhk=lh+3;
//Spielraum für Basis (nur in basisonly() verwenden)
sr=1;

show_basis=false;

module basis()
{
  translate([-p,-p,0])
  cube([p*3+sr,p*3+sr,lh]);
}

module pflock()
{
  if (show_basis)
  basis();
  cube([p+sr,p+sr,hp]);
}

module latte()
{  
  cube([ll,ld,lh]);
}

module pflock_vorne_links()
{
pflock();
}

module pflock_vorne_rechts()
{
//Pflock vorne rechts
translate([ll-p,0,0])
pflock();
}

module pflock_hinten_rechts()
{
//Pflock hinten rechts
translate([ll-p,ll-p,0])
pflock();
}

module pflock_hinten_links()
{
//Pflock hinten links
translate([0,ll-p,0])
pflock();
}

module latten_vorne()
{
//Latten vorne
//unten
translate([0,-ld/2,lhk*2])
latte();
//oben
translate([0,-ld/2,lhk*4])
latte();
}

module latten_links()
{
//Latten links
//unten
translate([ld/2,0,lhk])
rotate([0,0,90])
latte();
//oben
translate([ld/2,0,lhk*3])
rotate([0,0,90])
latte();
}

module latten_rechts()
{
//Latten rechts
//unten
translate([ld/2+ll,0,lhk])
rotate([0,0,90])
latte();
//oben
translate([ld/2+ll,0,lhk*3])
rotate([0,0,90])
latte();
}

module latten_hinten()
{
//Latten hinten
//unten
translate([0,-ld/2+ll,lhk*2])
latte();
//oben
translate([0,-ld/2+ll,lhk*4])
latte();
}

module gesamt()
{
pflock_vorne_links();
pflock_vorne_rechts();
pflock_hinten_links();
pflock_hinten_rechts();

latten_vorne();
latten_hinten();
latten_links();
latten_rechts();
}

//gesamt();

module pflock_vorne_links_raw()
{
    difference()
    {
        pflock_vorne_links();
        latten_vorne();
        latten_links();
    }
}

//pflock_vorne_links_raw();

module pflock_vorne_rechts_raw()
{
    difference()
    {
        pflock_vorne_rechts();
        latten_vorne();
        latten_rechts();
    }
}

//pflock_vorne_rechts_raw();

module pflock_vorne_raw()
{
    difference()
    {
        pflock_vorne_links();
        latten_vorne();
    }
}

//pflock_vorne_raw();

module pflock_links_raw()
{
    difference()
    {
        pflock_vorne_links();
        latten_links();
    }
}

//pflock_links_raw();

module basisonly()
{
    difference()
    {
        basis();
        pflock();
    }
}

basisonly();
