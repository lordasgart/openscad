$fn=36;
$sl = 7; //schraubenlänge gesamt
$sk = 1.5; //schraube kopfdicke
$pd = 1.5; //plattinendicke
$ledh = 7 - $pd; //led höhe
$lsqa = 45; //breite und höhe led leucht fläche
//50*70.2 //platinenmaße
$pb = 50;
$ph = 70.2;
$z=5.2;//abstand oben led quadratfläche
$x=1.7;//abstand links led quadratfläche
$agesamt=$pb-$lsqa;//
$x2=$agesamt-$x;
$ad=$agesamt/2; //durchschnittsabstand
$ax=$x2-$x; //zusatzshift ist durschschnittsabstand (also soll - tatsächlichen abstand
//falsch, da wir ja immer rechts mehr als den durschschnittsabstand haben, müssen wir schauen, dass wir links auf die breite von rechts kommen, der versinkt ja nirgends
$depth = 24; //tiefe von platine bis tiefsten bauteil (schalter)
$t=2.4;
$lr2lrh = 68; //loch von außenrand zu außenrand => mit platinenmaßen und loch durchmesser kann abstand von außen berechnet werden
$lr2lrb = 48.4;
$rb = ($pb-$lr2lrb)/2; //rand breite (lochabstand)
$rh = ($ph-$lr2lrh)/2; //rand breite (lochabstand)
$ld = 2.2; //loch durchmesser schrauben von platine
$lds = 1.4; //schraube selbst durchmesser 1.7 dünne gewindestelle 1.4
$mr = 2.8; //maximaler Radius von zentrum platinenloch bis zur nähesten lötstelle
$lswd = 5.8; //durchmesser switch loch
$lstd = 7.8; //durchmesser stecker loch
$hw = 4.8 - $pd; //hoehe widerstände, lötseite brauche ich nicht, da hier die schauben eh länger sind als benötigt
$loetd = 4; //doch lieber einkalkulieren, mit der 9v batterie könnte es dann doch eng werden
$mra = 1.4; //minimaler rand (links von vorne)
$schalter = 13; //höhe und breite schalter
$ast = $schalter + 2 - $lstd/2; //abstand stecker + switch, da switch 13 (mit toleranz 15)
$9vb=26.4; //wiki 26.2
$9vd=17.2; //wiki 17
$9vh=44; //wiki 48.5 aber wir wollen ja, dass er oben raussteht
//9v batteriefach
$9vbs=$9vb+$t*2;
$9vds=$9vd+$t;
$9vhs=$9vh+$t;

echo ("ledh: ", $ledh);
echo ("agesamt: ", $agesamt);
echo ("x2: ", $x2);
echo ("ad: ", $ad);
echo ("ax: ", $ax);

/* [Wände] */
$platine = false;
$waende = true;
$rueckwand = true;
$loetzinn = false;

////////////////////
// Modules
////////////////////

module loch($h,$d,$y)
{
    translate([0,$y+$pd,0])
    rotate([90,0,0])
    cylinder(h=$h,d1=$d,d2=$d);
}

module platinenloch()
{
    loch($pd,$ld,0);
}

module platine()
{
    if ($platine)
    {
        color("green")
        cube([$pb,$pd,$ph]);
    }
    
    if ($platine)
    {
        loecher()
        {
            color("orange")
            platinenloch();
        }
    }
}

module schraubenloecher()
{
    loecher()
    {
        color("gray")
        loch($sl,$lds,$sl);
    }
}

module loecher()
{
    translate([$ld/2+$rb,0,$ld/2+$rh])
    children(0);
    
    translate([$pb-$ld/2-$rb,0,$ld/2+$rh])
    children(0);
    
    translate([$pb-$ld/2-$rb,0,$ph-$ld/2-$rh])
    children(0);
    
    translate([$ld/2+$rb,0,$ph-$ld/2-$rh])
    children(0);  
}

module platinenzentrum()
{
    difference()
    {
        color("white")
        loecher()
        {
            loch($depth,$mr,$depth);
        }
        platine();
    }

    if ($platine)
    {
        //LEDs
        color("white")
        translate([$x,-$ledh,$ph-$lsqa-$z])
        cube([$lsqa,$ledh,$lsqa]);
    }
}

if ($loetzinn)
{
    //Lötzinn
    color("gray")
    translate([$ax+$mra/2,$pd,$mra/2])
    cube([$pb-$mra,$loetd,$ph-$mra]);
}

module waende()
{
    if ($waende)
    {
        //Wände
        //links
        translate([-$t,$pd,0])
        cube([$t,$depth,$ph]);
        //rechts
        translate([$pb+$ax,$pd,0])
        cube([$t,$depth,$ph]);

        //links
        color("pink")
        translate([-$t,-$ledh,0])
        cube([$t,$pd+$ledh,$ph]);
        //rechts
        color("pink")
        translate([$pb+$ax,-$ledh,0])
        cube([$t,$pd+$ledh,$ph]);

        //unten
        color("#FF0000")
        translate([-$t,-$ledh,-$t])
        cube([$t+$pb+$ax+$t,$pd+$ledh,$t]);

        //unten
        color("#FF4444")
        translate([-$t,$pd,-$t])
        cube([$t+$pb+$ax+$t,$depth,$t]);
    }
}

module oberteil()
{
    difference()
    {
        //oben gehäuse
        color("#FF4444")
        translate([-$t,$pd,$ph])
        cube([$t+$pb+$ax+$t,$depth,$t]);
        
        batterie();
    }
    
    //oben blende
    color("#FF0000")
    translate([-$t,-$ledh,$ph])
    cube([$t+$pb+$ax+$t,$pd+$ledh,$t]);
}

module rueckwand()
{       
    if ($rueckwand)
    {
        difference()
        {
            //hinten
            color("#FF8888") //absichtlich, damit perspektive von vorne besser mittigkeit von leds beurteilen lässt
            translate([-$t,$depth+$pd,-$t])
            cube([$t+$pb+$ax+$t,$t,$t+$ph+$t]);
                
            //loch stecker
            translate([$ast+$ax,$pd,$ast])
            color("#AA88FF")
            loch($t,$lstd,$depth+$t-$pd);

            //loch schalter
            translate([$pb-$ast,$pd,$ast])
            color("#AA8822")
            loch($t,$lswd,$depth+$t-$pd);
        }
    }
}

module platinenersatz()
{
    //platinenersatz
    //damit kein staub rein kommt, könnten wir ja links den schlitz zudrucken, mit einem stück was ax füllt und so dick ist wie die platine
    color("#44FF44")
    translate([0,$pd,0]) cube([$ax,$depth, $ph]); //nur bis zu den löchern, dann ist mehr spielraum.... will ich doch die andere variante, dann einfach diese zeile inkl. translate auskommentiert und andere einkommentieren
    //cube([$ax,$pd+$depth, $ph]); //das muss bis hinter, sonst muss ich support drucken
}

module platinenhalter_h()
{
    cube([$rb+$ld+($mr-$ld)/2-$mr/2,$depth,$rh+$ld+($mr-$ld)/2]);
}

module platinehalter_v()
{
    cube([$rb+$ld+($mr-$ld)/2,$depth,$rh+$ld+($mr-$ld)/2-$mr/2]);
}

module platinenhalterzumrand()
{
    //platinenhalter zum rand
    //ru (von vorne, von hinten lu) 
    translate([$ax,$pd,0])
    platinenhalter_h();
    translate([$ax,$pd,0])
    platinehalter_v();
    
    //ro
    translate([$ax,$pd,$ph-($rh+$ld+($mr-$ld)/2)])
    platinenhalter_h();
    translate([$ax,$pd,$ph-($rh+$ld+($mr-$ld)/2-$mr/2)])
    platinehalter_v();
    
    //lu
    translate([($ax+$pb)-($rb+$ld+($mr-$ld)/2-$mr/2),$pd,0])
    platinenhalter_h();
    translate([($ax+$pb)-($rb+$ld+($mr-$ld)/2),$pd,0])
    platinehalter_v();
   
    //lo
    translate([($ax+$pb)-($rb+$ld+($mr-$ld)/2-$mr/2),$pd,$ph-($rh+$ld+($mr-$ld)/2)])
    platinehalter_v();
    translate([($ax+$pb)-($rb+$ld+($mr-$ld)/2),$pd,$ph-($rh+$ld+($mr-$ld)/2-$mr/2)])
    platinehalter_v();
}

module batterie()
{
    //9v batterie (oben muss er durchstoßen, aber hinten nehmen wir einfach die Wand die eh schon da ist)
    
    color("#973512")
    translate([(($ax+$pb)-$9vb)/2,$pd+$depth-$9vd,($ph-$9vh)+$t])
    cube([$9vb,$9vd,$9vh]);
}

module batteriefach()
{
    color("#351297")
    translate([(($ax+$pb)-$9vbs)/2,$pd+$depth-$9vds,($ph-$9vhs)+$t])
    cube([$9vbs,$9vds,$9vhs]);
}

module batterieholder()
{
    difference()
    {
        batteriefach();
        batterie();
    }
}

module gehause()
{
    translate([$ax,0,0])
    platinenzentrum();

    waende();

    rueckwand();

    platinenersatz();

    color("#AAAAFF")
    platinenhalterzumrand();
}

module oberteil2()
{
    translate([-$t,-$ledh,$ph])
    cube([$t+$pb+$ax+$t,$pd+$ledh+$depth-$9vds,$t]);
}

module oberteilmitbatteriefach()
{
    batterieholder();
    difference()
    {
        oberteil();
        oberteil2();
    }
}

module gehausemitloch()
{
    difference()
    {
        gehause();
        translate([$ax,0,0])
        schraubenloecher();
    }
}

////////////////////
//Render
////////////////////

//gehausemitloch();
//oberteilmitbatteriefach();
oberteil2();
