
$t = 4; //Mimi hat 4mm Plexiglasdicke geschickt
$h = 36;
$th = $t*2;
$ht = $h + $th; //height and width = 50 + 4 (t)

module winkel()
{
cube([$h,$ht,$th]);
cube([$h,$th,$ht]);
}

module stabilizer()
{
translate([$th,0,0])
rotate([0,-90,0])
linear_extrude(height=$th)
polygon([[$th,$ht],[$ht,$th],[0,0]]);
}

module complete()
{
winkel();
stabilizer();
translate([$h-$th,0,0])
stabilizer();
}

module edgeholder()
{
complete();
translate([$h,-$t,0])
rotate([0,0,180])
complete();

translate([0,-$ht-$t,0])
cube([$h,$ht*2+$t,$th]);
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
edgeholder();
translate([$breite-$th/2,0,0])
edgeholder();
}

module windows()
{
window();
color("silver")
translate([$breite,0,0])
window();
}

//windows();

edgeholder();

//middleholder();

//translate([$breite*2-$ht,0,0])
//edgeholder();