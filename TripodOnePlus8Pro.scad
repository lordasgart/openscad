t=44.4; //Tiefe Basis
b=44.4; //Breite Basis
t2=35; //Tiefe Oben
b2=35; //Breite Oben

td=(t-t2)/2;
bd=(b-b2)/2;

ht=10.2; //Höhe Total
hb=1.6; //Höhe unterer Cubus
ho=ht-hb; //Höhe oben (polyhedron)

CubePoints = [
  [  0,  0,  0 ],  //0
  [ b,  0,  0 ],  //1
  [ b,  t,  0 ],  //2
  [  0,  t,  0 ],  //3
  [  bd,  bd,  ho ],  //4
  [ t-bd,  bd,  ho ],  //5
  [ t-bd,  t-bd,  ho ],  //6
  [  bd,  t-bd,  ho ]]; //7
  
CubeFaces = [
  [0,1,2,3],  // bottom
  [4,5,1,0],  // front
  [7,6,5,4],  // top
  [5,6,2,1],  // right
  [6,7,3,2],  // back
  [7,4,0,3]]; // left

module tripod()
{
translate([0,0,hb])  
polyhedron( CubePoints, CubeFaces );

cube([t,b,hb]);
}

//Handy

hh=174.0; //Höhe Handy
bh=80; //Breite Handy
th=11.5; //Tiefe gemessen 9.4, Laut Hersteller nur 8.0

module handy()
{
    color("silver")
    translate([(b-hh)/2,(t-th)/2,ht])
    cube([hh,th,bh]);
}

module vorne()
{
    translate([bd,(t-th)/2-th,ht])
    cube([b2,th,bh]);
}

module hinten()
{
    translate([bd,(t-th)/2+th,ht])
    cube([b2,th,bh]);
}

module stabilisator()
{
    cube([b2,(t-th)/2-th-td,ht]);
}

module stabilisatoren()
{
    translate([bd,td,ht])
    stabilisator();
    
    translate([bd,(t-th)/2+th*2,ht])
    stabilisator();
}

module platte_laptop()
{
translate([-t*3/2+b/2,-t*3/2+t/2,ht])
cube([t*3,t*3,3.2]);
}

module platte_rogphone()
{
translate([-hh/2+b/2,-bh/2+t/2,ht])
cube([hh,bh,3.2]);
}



tripod();

handy();
vorne();
hinten();
stabilisatoren();
//platte_laptop();
platte_rogphone();
