$fn=36;

//Thickness Magnet
tm=4;
//Durchmesser Magnet
dm=20;

//Das ist der Magnet
//cylinder(h=tm, d=dm);

//Jetzt ne Hülle

//Dicke aussenrum
//da=1.xyz //je nach Slicer Vorschlägen

da=1.5;

//       Hülle hohl = 
difference()
{
    //   Hülle vollausgefüllt
    cylinder(h=tm+da, d=dm+da*2);
    // - Magnet (siehe auch oben)
    cylinder(h=tm, d=dm);
}