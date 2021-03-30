baseheight = 8;

circlesegments = 128;

outerradius = 30.2;//60.4 mm
innerradius = 24.6;//48.4 mm + 0,8 Toleranz = 49.2

holderwidth = 35;
holderdepth = 10;
holderheight = innerradius*2;

holderthickness = 4.0;

ringspacewidth = 14;

difference()
{
    linear_extrude(height = baseheight)
    difference() {
        circle(outerradius, $fn=circlesegments);
        circle(innerradius, $fn=circlesegments);
    }
    
    translate([-ringspacewidth/2,innerradius-1,0])
    cube([ringspacewidth,outerradius-innerradius+2,baseheight]);
}

translate([-holderwidth/2,-innerradius-holderdepth-holderthickness,0]) //[Hälfte der Grundplatte (dann ist es mittig), -24.4-10, 0)
{       
    cube([holderwidth,holderdepth,baseheight]); //35 (gerade so breit, dass es bündig mit dem Kreis ist), 11 ist die reine Standfläche, 8 = so hoch wie der Kreis
    
    //vordere Platte
    translate([0,-holderthickness,0])
    cube([holderwidth,holderthickness,holderheight]); //48 = ~Hälfte vom S7 (40) + 8 von der Basisplatte => nehmen wir 48.4 dann haben wir exakt den Durchmesser vom inneren Kreis, -3.6 translate => Wände außerhalb, damit wir unsere volle Standfläche von 11 bekommen
    
    //hintere Platte am Holm
    translate([0,holderdepth,0])
    cube([holderwidth,holderthickness,holderheight/2]);
}
