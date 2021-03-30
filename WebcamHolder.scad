difference()
{

    linear_extrude(height = 8)
    difference() {
        circle(30.2, $fn=64);//60.4 mm
        circle(24.4, $fn=64);//48.4 mm + 0,2 Toleranz = 48.8
    }
    
    //translate([-4,24,0])
    //cube([8,8,8]);
}



translate([-17.5,-34.4,0]) //[Hälfte der Grundplatte, -24.4-10, 0)
{    
    cube([35,10,8]); //35 (gerade so breit, dass es bündig mit dem Kreis ist), 11 ist die reine Standfläche, 8 = so hoch wie der Kreis
    
    translate([0,-3.6,0])
    cube([35,3.6,48.8]); //48 = ~Hälfte vom S7 (40) + 8 von der Basisplatte => nehmen wir 48.4 dann haben wir exakt den Durchmesser vom inneren Kreis, -3.6 translate => Wände außerhalb, damit wir unsere volle Standfläche von 11 bekommen
}