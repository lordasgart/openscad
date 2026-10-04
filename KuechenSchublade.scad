//Küchenschublade

//Höhe
t=3;
h=t;
d=50;

module schublade(hs)
{
    linear_extrude(height = hs)
    import("/home/lordasgart/Nextcloud/Documents/3D/Inkscape/kuechen-schublade.svg");
}

module part2()
{
difference()
{
    schublade(d);
    translate([-t,0,0])
    schublade(d);
    //translate([-t,-t,0])
    //schublade(d);    
    //translate([-t,t,0])
    //schublade(d);
    translate([-15,0,0])
    cube(d,d,d);
}
}

part2();
schublade(t);