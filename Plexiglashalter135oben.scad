
$t = 3; //Mimi hat 4mm Plexiglasdicke geschickt
$h = 36;
$th = 8;//$t*2; //8
$ht = $h + $th; //height and width = 50 + 4 (t)

module winkel()
{
//cube([$h,$ht,$th]);
cube([$h,$th,$ht]);
}

module stabilizer()
{
translate([$th,0,0])
rotate([0,-90,0])
linear_extrude(height=$th)
polygon([[$th,$ht],[$ht,$th],[0,0]]);
}

module complete(s1=true,s2=true)
{
  winkel();
  if (s1)
    stabilizer();
  if (s2)
  {
    translate([$h-$th,0,0])
    stabilizer();
  }
}

module edgeholder(s1=true,s2=true,s3=true,s4=true)
{
  complete(s1,s2);
  translate([$h,-$t,0])
  rotate([0,0,180])
  complete(s3,s4);

  translate([0,-$t,0])
  cube([$h,2+$t,$th]);
}

$breite=800;//80*92cm
$hoehe=920/2;

module window()
{
color("white")
translate([0,-$t,$th])
cube([$breite,$t,$hoehe]);
}

module middleholder()
{
translate([$breite-$h+$th/2,0,0])
edgeholder(false,false,false,false);
translate([$breite-$th/2,0,0])
edgeholder(false,false,false,false);
}

module windows()
{
window();
color("silver")
translate([$breite,0,0])
window();
}

//windows();

module total()
{
  translate([0,-$t,0])
  rotate([0,0,135])
  edgeholder(false,false,false,false);

  edgeholder(false,false,false,false);

  color("red")
  linear_extrude(height=$h+$th)
  polygon([[0,-$t],[0,-11],[-5.657,-8.657]]);
}

module glascut()
{
  translate([0,-$t,$th])
  color("blue")
  cube([$h,$t,$h]);

  translate([0,-$t,$th])
  color("blue")
  rotate([0,0,135])
  translate([0,-$t,0])
  cube([$h,$t,$h]);
}

difference()
{
  total();
  glascut();
}

//middleholder();

//translate([$breite*2-$ht,0,0])
//edgeholder();