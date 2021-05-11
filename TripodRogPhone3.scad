//TRIPOD
//Tiefe Basis
t=43.6;
//Breite Basis
b=43.6;
//Tiefe Oben
t2=35;
//Breite Oben
b2=35;

//Höhe Total
ht=10.2;
//Höhe unterer Cubus
hb=1.6;

//plattendicke
pd=2.4;

//Höhe oben (polyhedron)
ho=ht-hb;
//?
td=(t-t2)/2;
//?
bd=(b-b2)/2;

//HANDY
//Breite Handy
bh=173.5*1.03;
//Höhe Handy
hh=79*1.03;
//Tiefe Handy mit Silikonhülle, ohne Kamera
th=11.0*1.03;

//Höhe Connector bis Micro
hc=11.0;

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
    translate([-b/2,-t/2,hb])  
    polyhedron(CubePoints, CubeFaces);

    color("blue")
    translate([0,0,hb/2]) //in der höhe nicht center, daher hb/2 von der unteren tripod platte nach oben
    cube([t,b,hb], center=true);
}

module connector_plate()
{
    //2/3 der Plattendicke => pd/3*2
    color("silver")
    translate([0,0,ht])
    cube([t2,b2,pd/3*2], center=true);
}

module plate()
{
    color("green")
    translate([0,0,ht+pd/2])
    cube([bh+pd*2,t,pd], center=true);
}

module connector()
{
    color("orange")
    translate([0,0,ht+pd+hc/2])
    cube([bh+pd*2,t,hc], center=true);
}

module handy()
{
    color("silver")
    translate([0,0,ht+pd+hh/2])
    cube([bh,th,hh], center=true);
}

module screencut()
{
    color("red")
    translate([0,-(t-th)/2,ht+pd+hc/2])
    cube([bh-10*2,t,hc], center=true);
}

module connector_with_cuts()
{
    difference()
    {
        connector();
        handy();
        screencut();
    }
}

//tripod();
//connector_plate();
//plate();

//connector();
//handy();
//screencut();

//connector_with_cuts();

module pillar()
{
    cube([12,16,3.6]);
    cube([3.6,16,36]);
}

pillar();















module handy_old()
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

//tripod();
//
////handy();
////vorne();
//hinten();
////stabilisatoren();
////platte_laptop();
//platte_rogphone();
//vorne_rechts();
//vorne_links();
//
//translate([dv,0,0])
//vorne_rechts();
//translate([dv,th,0])
//vorne_rechts();
//
//translate([-dv,0,0])
//vorne_links();
//translate([-dv,th,0])
//vorne_links();