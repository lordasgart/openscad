//Keil
//Symmetrischer Keil mit rundum gerundeten Ecken und Kanten.
//Ober- und Unterseite sind gleich schraeg, die Spitze liegt auf halber Hoehe,
//dadurch sind beide Winkel am dicken Ende gleich.
//Die Aussenmasse (laenge x breite x dicke) bleiben trotz Rundung erhalten:
//die Kugeln der Huelle sitzen um den Radius r nach innen versetzt.
//
//Seitenansicht (x = Laenge, z = Dicke):
//
//   z=dicke  __
//           |  ‾‾‾‾----____
//           |              ‾‾‾‾----___
//           |                         )   <- Spitze ist 2*r dick
//           |              ____----‾‾‾
//   z=0     |__----‾‾‾‾‾‾‾‾
//          x=0                      x=laenge

/* [Allgemein] */

//Ausrichtung:
//einbau   = Keil liegt mit der Spitze waagerecht (nur zum Ansehen)
//liegend  = auf die flache Seite gelegt -> zum Drucken
ausrichtung="liegend"; // [einbau, liegend]

/* [Masse] */

//Laenge des Keils
laenge=16;
//Dicke an der dicksten Stelle
dicke=5;
//Breite des Keils
breite=10;
//Rundungsradius (Spitze wird 2*r dick)
r=1;

$fn=48;

module keil() {
    hull() {
        for (y=[r, breite-r]) {
            translate([r,        y, r])        sphere(r);  //dickes Ende unten
            translate([r,        y, dicke-r])  sphere(r);  //dickes Ende oben
            translate([laenge-r, y, dicke/2])  sphere(r);  //Spitze, mittig
        }
    }
}

if (ausrichtung=="liegend")
    //Seite y=0 nach unten aufs Druckbett, Keil bleibt im positiven Bereich
    translate([0, dicke, 0]) rotate([90, 0, 0]) keil();
else
    keil();

//Winkel zur Kontrolle (Flanken verlaufen tangential zwischen den Kugeln)
flanke = atan((dicke/2 - r) / (laenge - 2*r));
echo(winkel_hinten_oben = 90 - flanke, winkel_hinten_unten = 90 - flanke, winkel_spitze = 2*flanke);
