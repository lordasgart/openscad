//Tischerhöhung

//Fehlende Höhe
f=23.2; 
//Beine
b=60;

module erhoehung()
{
    linear_extrude(height = f)
    import("/home/lordasgart/Nextcloud/Documents/3D/Ideen/TischerhoehungSimplified.svg");
}

re=b*1.1;

difference()
{
    resize([re,re,f])
    translate([-(re-b)/2,-(re-b)/2,f])
    erhoehung();

    translate([0,0,f])
    erhoehung();
}

erhoehung();