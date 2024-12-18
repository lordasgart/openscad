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



difference()
{   
    oben();

    translate([0,0,f])
    erhoehung();
}

erhoehung();

module top(factor,h) {    
    r=b*factor;
    resize([r,r,h])
    translate([-(r-b)/2,-(r-b)/2,h])
    erhoehung();
}

module oben()
{
    top(1.00,f-2);
    top(1.005,f-1.9);
    top(1.01,f-1.8);
    top(1.015,f-1.7);
    top(1.02,f-1.6);
    top(1.025,f-1.5);
    top(1.03,f-1.4);
    top(1.035,f-1.3);
    top(1.04,f-1.2);
    top(1.045,f-1.1);
    top(1.05,f-1.0);
    top(1.055,f-0.9);
    top(1.06,f-0.8);
    top(1.065,f-0.7);
    top(1.07,f-0.6);
    top(1.075,f-0.5);
    top(1.08,f-0.4);
    top(1.085,f-0.3);
    top(1.09,f-0.2);
    top(1.095,f-0.1);
    top(1.1,f);    
}