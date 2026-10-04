module schublade()
{
    linear_extrude(height = 1)
    //linear_extrude(height = 50)
    import("/home/lordasgart/Nextcloud/Documents/3D/Inkscape/kuechen-schublade.svg");
}

module a()
{
difference()
{
    schublade();
    //translate([0,0,-3])
    //schublade();
    translate([-3,0,0])
    schublade();
}
 }
 
 module b()
 {

difference()
{
    schublade();
    translate([0,0,3])
    schublade();
}
}

schublade();