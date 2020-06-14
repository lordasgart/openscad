$fn=36;

$sl = 7; //schraubenlänge gesamt
$sk = 1.5; //schraube kopfdicke
$pd = 1.5; //plattinendicke
$ledh = 7 - $pd; //led höhe
echo ("ledh: ", $ledh);

$lsqa = 45; //breite und höhe led leucht fläche

//50*70.2 //platinenmaße
$pb = 50;
$ph = 70.2;
$z=5.2;//abstand oben led quadratfläche
$x=1.7;//abstand links led quadratfläche
$agesamt=$pb-$lsqa;//
$x2=$agesamt-$x;
echo ("agesamt: ", $agesamt);
echo ("x2: ", $x2);
$ad=$agesamt/2; //durchschnittsabstand
echo ("ad: ", $ad);
$ax=$x2-$x; //zusatzshift ist durschschnittsabstand (also soll - tatsächlichen abstand
//falsch, da wir ja immer rechts mehr als den durschschnittsabstand haben, müssen wir schauen, dass wir links auf die breite von rechts kommen, der versinkt ja nirgends
echo ("ax: ", $ax);

$depth = 24; //tiefe von platine bis tiefsten bauteil (schalter)

$t=2.4;

$lr2lrh = 68; //loch von außenrand zu außenrand => mit platinenmaßen und loch durchmesser kann abstand von außen berechnet werden
$lr2lrb = 48.4;
$rb = ($pb-$lr2lrb)/2; //rand breite (lochabstand)
$rh = ($ph-$lr2lrh)/2; //rand breite (lochabstand)

$ld = 2.2; //loch durchmesser schrauben von platine
$lds = 1.7; //schraube selbst durchmesser
$mr = 2.8; //maximaler Radius von zentrum platinenloch bis zur nähesten lötstelle

$lswd = 5.8; //durchmesser switch loch
$lstd = 7.8; //durchmesser stecker loch


$hw = 4.8 - $pd; //hoehe widerstände, lötseite brauche ich nicht, da hier die schauben eh länger sind als benötigt

$loetd = 4; //doch lieber einkalkulieren, mit der 9v batterie könnte es dann doch eng werden

$mra = 1.4; //minimaler rand (links von vorne)

$schalter = 13; //höhe und breite schalter

$ast = $schalter + 2 - $lstd/2; //abstand stecker + switch, da switch 13 (mit toleranz 15)

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
color("blue")
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

translate([$ax,0,0])
platinenzentrum();

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

//oben
color("#FF0000")
translate([-$t,-$ledh,$ph])
cube([$t+$pb+$ax+$t,$pd+$ledh,$t]);

//unten
color("#FF4444")
translate([-$t,$pd,-$t])
cube([$t+$pb+$ax+$t,$depth,$t]);

//oben
color("#FF4444")
translate([-$t,$pd,$ph])
cube([$t+$pb+$ax+$t,$depth,$t]);
}

if ($rueckwand)
{
//hinten
color("#FF8888") //absichtlich, damit perspektive von vorne besser mittigkeit von leds beurteilen lässt
translate([-$t,$depth,-$t])
cube([$t+$pb+$ax+$t,$t,$t+$ph+$t]);
}

//platinenersatz
//damit kein staub rein kommt, könnten wir ja links den schlitz zudrucken, mit einem stück was ax füllt und so dick ist wie die platine
color("#44FF44")
cube([$ax,$pd+$depth, $ph]); //das muss bis hinter, sonst muss ich support drucken

//loch stecker
translate([$ast+$ax,0,$ast])
color("#AA88FF")
loch($t,$lstd,$depth+$t-$pd);

//loch schalter
translate([$pb-$ast,0,$ast])
color("#AA8822")
loch($t,$lswd,$depth+$t-$pd);


//platinenhalter zum rand
color("#AAAAFF")
translate([$ax,$pd,0])
cube([$rb+$ld+($mr-$ld)/2-$mr/2,$depth,$rh+$ld+($mr-$ld)/2]);

color("#AAAAFF")
translate([$ax,$pd,0])
cube([$rb+$ld+($mr-$ld)/2,$depth,$rh+$ld+($mr-$ld)/2-$mr/2]);

color("#AAAAFF")
translate([$ax,$pd,$ph-($rh+$ld+($mr-$ld)/2)])
cube([$rb+$ld+($mr-$ld)/2-$mr/2,$depth,$rh+$ld+($mr-$ld)/2]);

color("#AAAAFF")
translate([$ax,$pd,$ph-($rh+$ld+($mr-$ld)/2-$mr/2)])
cube([$rb+$ld+($mr-$ld)/2,$depth,$rh+$ld+($mr-$ld)/2-$mr/2]);

color("#AAAAFF")
translate([($ax+$pb)-($rb+$ld+($mr-$ld)/2-$mr/2),$pd,0])
cube([$rb+$ld+($mr-$ld)/2-$mr/2,$depth,$rh+$ld+($mr-$ld)/2]);

color("#AAAAFF")
translate([($ax+$pb)-($rb+$ld+($mr-$ld)/2),$pd,0])
cube([$rb+$ld+($mr-$ld)/2,$depth,$rh+$ld+($mr-$ld)/2-$mr/2]);

color("#AAAAFF")
translate([($ax+$pb)-($rb+$ld+($mr-$ld)/2-$mr/2),$pd,$ph-($rh+$ld+($mr-$ld)/2)])
cube([$rb+$ld+($mr-$ld)/2-$mr/2,$depth,$rh+$ld+($mr-$ld)/2]);

color("#AAAAFF")
translate([($ax+$pb)-($rb+$ld+($mr-$ld)/2),$pd,$ph-($rh+$ld+($mr-$ld)/2-$mr/2)])
cube([$rb+$ld+($mr-$ld)/2,$depth,$rh+$ld+($mr-$ld)/2-$mr/2]);

//9v batterie (oben muss er durchstoßen, aber hinten nehmen wir einfach die Wand die eh schon da ist)
$9vb=26.4; //wiki 26.2
$9vd=17.2; //wiki 17
$9vh=44; //wiki 48.5 aber wir wollen ja, dass er oben raussteht
color("#973512")
translate([(($ax+$pb)-$9vb)/2,$pd+$depth-$9vd,($ph-$9vh)+$t])
cube([$9vb,$9vd,$9vh]);

//9v batteriefach
$9vbs=$9vb+$t*2;
$9vds=$9vd+$t;
$9vhs=$9vh+$t;
color("#351297")
translate([(($ax+$pb)-$9vbs)/2,$pd+$depth-$9vds,($ph-$9vhs)+$t])
cube([$9vbs,$9vds,$9vhs]);
