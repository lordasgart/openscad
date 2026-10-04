//Küchenschublade

//Höhe
h=10;

module schublade()
{
    linear_extrude(height = h)
    import("/home/lordasgart/Nextcloud/Documents/3D/Inkscape/kuechen-schublade.svg");
}

schublade();
