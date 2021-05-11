t=43.8; //Tiefe Basis
b=43.8; //Breite Basis
t2=35; //Tiefe Oben
b2=35; //Breite Oben

td=(t-t2)/2;
bd=(b-b2)/2;

ht=10.2; //Höhe Total
hb=1.6; //Höhe unterer Cubus
ho=ht-hb; //Höhe oben (polyhedron)

//plattendicke
pd=1.6;
dv=3.8;

//Höhe Handy
hh=174.0*1.03;
//Breite Handy
bh=80*1.03/3;
//Tiefe Handy, gemessen 9.4, Laut Hersteller nur 8.0
th=11.5*1.03; 

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

module handy()
{
    color("silver")
    translate([(b-hh)/2,(t-th)/2,ht+pd])
    cube([hh,th,bh]);
}

module vorne()
{
    translate([bd,(t-th)/2-th,ht+pd])
    cube([b2,th,bh]);
}

module hinten()
{
    trh = (t-th)/2+th;
        translate([bd,(t-th)/2+th,ht+pd])
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
cube([t*3,t*3,pd]);
}

module platte_rogphone()
{
    color("#AAAAFF")
translate([-hh/2+b/2-dv,-t/2+t/2,ht])
cube([hh+dv*2,t,pd]);
}

module vorne_rechts()
{
    translate([b+hh/2-b/2-dv,(t-th)/2-th,ht+pd])
    cube([dv,th,bh]);
}

module vorne_links()
{
    translate([-hh/2+b/2,(t-th)/2-th,ht+pd])
    cube([dv,th,bh]);
}

tripod();

//handy();
//vorne();
hinten();
//stabilisatoren();
//platte_laptop();
platte_rogphone();
vorne_rechts();
vorne_links();

translate([dv,0,0])
vorne_rechts();
translate([dv,th,0])
vorne_rechts();

translate([-dv,0,0])
vorne_links();
translate([-dv,th,0])
vorne_links();